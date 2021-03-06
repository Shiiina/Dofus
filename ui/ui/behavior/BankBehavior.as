﻿package ui.behavior
{
    import ui.AbstractStorageUi;
    import d2actions.ExchangeObjectMove;
    import d2actions.ExchangeObjectMoveKama;
    import d2hooks.ClickItemInventory;
    import d2hooks.ShowObjectLinked;
    import d2enums.SelectMethodEnum;
    import com.ankamagames.dofusModuleLibrary.enum.interfaces.UIEnum;
    import ui.enum.StorageState;
    import d2actions.ExchangeObjectTransfertAllFromInv;
    import d2actions.ExchangeObjectTransfertListFromInv;
    import d2actions.ExchangeObjectTransfertExistingFromInv;
    import d2actions.*;
    import d2hooks.*;

    public class BankBehavior implements IStorageBehavior 
    {

        protected var _storage:AbstractStorageUi;
        private var _objectToExchange:Object;


        public function filterStatus(enabled:Boolean):void
        {
        }

        public function dropValidator(target:Object, data:Object, source:Object):Boolean
        {
            return (true);
        }

        public function processDrop(target:Object, data:Object, source:Object):void
        {
            var quantityMax:uint;
            var weightLeft:uint;
            if (this.dropValidator(target, data, source))
            {
                if (data.quantity > 1)
                {
                    this._objectToExchange = data;
                    quantityMax = data.quantity;
                    weightLeft = (this._storage.getWeightMax() - this._storage.getWeight());
                    if ((data.realWeight * data.quantity) > weightLeft)
                    {
                        quantityMax = Math.floor((weightLeft / data.realWeight));
                    };
                    Api.common.openQuantityPopup(1, quantityMax, quantityMax, this.onValidNegativQty);
                }
                else
                {
                    Api.system.sendAction(new ExchangeObjectMove(data.objectUID, -1));
                };
            };
        }

        private function onValidNegativQty(qty:Number):void
        {
            Api.system.sendAction(new ExchangeObjectMove(this._objectToExchange.objectUID, -(qty)));
        }

        public function onValidQtyDrop(qty:Number):void
        {
        }

        private function onValidQty(qty:Number):void
        {
            Api.system.sendAction(new ExchangeObjectMove(this._objectToExchange.objectUID, qty));
        }

        private function onValidQtyKama(qty:Number):void
        {
            Api.system.sendAction(new ExchangeObjectMoveKama(qty));
        }

        public function onRelease(target:Object):void
        {
            var _local_2:uint;
            switch (target)
            {
                case this._storage.kamaCtr:
                    _local_2 = Api.player.characteristics().kamas;
                    if (_local_2 > 0)
                    {
                        Api.common.openQuantityPopup(1, _local_2, _local_2, this.onValidQtyKama);
                    };
                    break;
            };
        }

        public function onSelectItem(target:Object, selectMethod:uint, isNewSelection:Boolean):void
        {
            var _local_4:Object;
            switch (target)
            {
                case this._storage.grid:
                    _local_4 = this._storage.grid.selectedItem;
                    switch (selectMethod)
                    {
                        case SelectMethodEnum.CLICK:
                            Api.system.dispatchHook(ClickItemInventory, _local_4);
                            if (!(Api.system.getOption("displayTooltips", "dofus")))
                            {
                                Api.system.dispatchHook(ShowObjectLinked, _local_4);
                            };
                            break;
                        case SelectMethodEnum.DOUBLE_CLICK:
                            Api.ui.hideTooltip();
                            if (Api.inventory.getItem(_local_4.objectUID))
                            {
                                Api.system.sendAction(new ExchangeObjectMove(_local_4.objectUID, 1));
                            };
                            break;
                        case SelectMethodEnum.CTRL_DOUBLE_CLICK:
                            if (Api.inventory.getItem(_local_4.objectUID))
                            {
                                Api.system.sendAction(new ExchangeObjectMove(_local_4.objectUID, _local_4.quantity));
                            };
                            break;
                        case SelectMethodEnum.ALT_DOUBLE_CLICK:
                            this._objectToExchange = target.selectedItem;
                            Api.common.openQuantityPopup(1, target.selectedItem.quantity, target.selectedItem.quantity, this.onValidQty);
                            break;
                    };
                    break;
            };
        }

        public function attach(storageUi:AbstractStorageUi):void
        {
            this._storage = storageUi;
            Api.system.disableWorldInteraction();
            this._storage.questVisible = false;
            this._storage.btnMoveAll.visible = true;
            var kamas:uint = Api.player.characteristics().kamas;
            if (kamas > 0)
            {
                this._storage.kamaCtr.mouseEnabled = true;
                this._storage.kamaCtr.handCursor = true;
            };
        }

        public function detach():void
        {
            Api.system.enableWorldInteraction();
            this._storage.questVisible = true;
            this._storage.btnMoveAll.visible = false;
        }

        public function onUnload():void
        {
            Api.ui.unloadUi(UIEnum.BANK_UI);
        }

        public function getStorageUiName():String
        {
            return (UIEnum.STORAGE_UI);
        }

        public function getName():String
        {
            return (StorageState.BANK_MOD);
        }

        public function get replacable():Boolean
        {
            return (false);
        }

        public function transfertAll():void
        {
            Api.system.sendAction(new ExchangeObjectTransfertAllFromInv());
        }

        public function transfertList():void
        {
            Api.system.sendAction(new ExchangeObjectTransfertListFromInv(this._storage.itemsDisplayed));
        }

        public function transfertExisting():void
        {
            Api.system.sendAction(new ExchangeObjectTransfertExistingFromInv());
        }


    }
}//package ui.behavior

