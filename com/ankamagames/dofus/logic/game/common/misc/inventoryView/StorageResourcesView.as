﻿package com.ankamagames.dofus.logic.game.common.misc.inventoryView
{
    import com.ankamagames.dofus.logic.game.common.misc.HookLock;
    import com.ankamagames.dofus.logic.game.common.managers.StorageOptionManager;
    import com.ankamagames.dofus.internalDatacenter.items.ItemWrapper;
    import com.ankamagames.dofus.misc.lists.InventoryHookList;
    import com.ankamagames.dofus.logic.game.common.managers.InventoryManager;

    public class StorageResourcesView extends StorageGenericView 
    {

        public function StorageResourcesView(hookLock:HookLock)
        {
            super(hookLock);
        }

        override public function get name():String
        {
            return ("storageResources");
        }

        override public function isListening(item:ItemWrapper):Boolean
        {
            return (((super.isListening(item)) && ((item.category == StorageOptionManager.RESOURCES_CATEGORY))));
        }

        override public function updateView():void
        {
            super.updateView();
            if (StorageOptionManager.getInstance().currentStorageView == this)
            {
                _hookLock.addHook(InventoryHookList.StorageViewContent, [content, InventoryManager.getInstance().inventory.localKamas]);
            };
        }


    }
}//package com.ankamagames.dofus.logic.game.common.misc.inventoryView

