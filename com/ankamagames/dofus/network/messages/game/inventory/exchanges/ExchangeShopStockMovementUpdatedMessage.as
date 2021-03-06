﻿package com.ankamagames.dofus.network.messages.game.inventory.exchanges
{
    import com.ankamagames.jerakine.network.NetworkMessage;
    import com.ankamagames.jerakine.network.INetworkMessage;
    import com.ankamagames.dofus.network.types.game.data.items.ObjectItemToSell;
    import flash.utils.ByteArray;
    import com.ankamagames.jerakine.network.CustomDataWrapper;
    import com.ankamagames.jerakine.network.ICustomDataOutput;
    import com.ankamagames.jerakine.network.ICustomDataInput;

    [Trusted]
    public class ExchangeShopStockMovementUpdatedMessage extends NetworkMessage implements INetworkMessage 
    {

        public static const protocolId:uint = 5909;

        private var _isInitialized:Boolean = false;
        public var objectInfo:ObjectItemToSell;

        public function ExchangeShopStockMovementUpdatedMessage()
        {
            this.objectInfo = new ObjectItemToSell();
            super();
        }

        override public function get isInitialized():Boolean
        {
            return (this._isInitialized);
        }

        override public function getMessageId():uint
        {
            return (5909);
        }

        public function initExchangeShopStockMovementUpdatedMessage(objectInfo:ObjectItemToSell=null):ExchangeShopStockMovementUpdatedMessage
        {
            this.objectInfo = objectInfo;
            this._isInitialized = true;
            return (this);
        }

        override public function reset():void
        {
            this.objectInfo = new ObjectItemToSell();
            this._isInitialized = false;
        }

        override public function pack(output:ICustomDataOutput):void
        {
            var data:ByteArray = new ByteArray();
            this.serialize(new CustomDataWrapper(data));
            writePacket(output, this.getMessageId(), data);
        }

        override public function unpack(input:ICustomDataInput, length:uint):void
        {
            this.deserialize(input);
        }

        public function serialize(output:ICustomDataOutput):void
        {
            this.serializeAs_ExchangeShopStockMovementUpdatedMessage(output);
        }

        public function serializeAs_ExchangeShopStockMovementUpdatedMessage(output:ICustomDataOutput):void
        {
            this.objectInfo.serializeAs_ObjectItemToSell(output);
        }

        public function deserialize(input:ICustomDataInput):void
        {
            this.deserializeAs_ExchangeShopStockMovementUpdatedMessage(input);
        }

        public function deserializeAs_ExchangeShopStockMovementUpdatedMessage(input:ICustomDataInput):void
        {
            this.objectInfo = new ObjectItemToSell();
            this.objectInfo.deserialize(input);
        }


    }
}//package com.ankamagames.dofus.network.messages.game.inventory.exchanges

