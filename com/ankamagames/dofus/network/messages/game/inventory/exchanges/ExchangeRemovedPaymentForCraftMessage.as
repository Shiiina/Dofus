﻿package com.ankamagames.dofus.network.messages.game.inventory.exchanges
{
    import com.ankamagames.jerakine.network.NetworkMessage;
    import com.ankamagames.jerakine.network.INetworkMessage;
    import flash.utils.ByteArray;
    import com.ankamagames.jerakine.network.CustomDataWrapper;
    import com.ankamagames.jerakine.network.ICustomDataOutput;
    import com.ankamagames.jerakine.network.ICustomDataInput;

    [Trusted]
    public class ExchangeRemovedPaymentForCraftMessage extends NetworkMessage implements INetworkMessage 
    {

        public static const protocolId:uint = 6031;

        private var _isInitialized:Boolean = false;
        public var onlySuccess:Boolean = false;
        public var objectUID:uint = 0;


        override public function get isInitialized():Boolean
        {
            return (this._isInitialized);
        }

        override public function getMessageId():uint
        {
            return (6031);
        }

        public function initExchangeRemovedPaymentForCraftMessage(onlySuccess:Boolean=false, objectUID:uint=0):ExchangeRemovedPaymentForCraftMessage
        {
            this.onlySuccess = onlySuccess;
            this.objectUID = objectUID;
            this._isInitialized = true;
            return (this);
        }

        override public function reset():void
        {
            this.onlySuccess = false;
            this.objectUID = 0;
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
            this.serializeAs_ExchangeRemovedPaymentForCraftMessage(output);
        }

        public function serializeAs_ExchangeRemovedPaymentForCraftMessage(output:ICustomDataOutput):void
        {
            output.writeBoolean(this.onlySuccess);
            if (this.objectUID < 0)
            {
                throw (new Error((("Forbidden value (" + this.objectUID) + ") on element objectUID.")));
            };
            output.writeVarInt(this.objectUID);
        }

        public function deserialize(input:ICustomDataInput):void
        {
            this.deserializeAs_ExchangeRemovedPaymentForCraftMessage(input);
        }

        public function deserializeAs_ExchangeRemovedPaymentForCraftMessage(input:ICustomDataInput):void
        {
            this.onlySuccess = input.readBoolean();
            this.objectUID = input.readVarUhInt();
            if (this.objectUID < 0)
            {
                throw (new Error((("Forbidden value (" + this.objectUID) + ") on element of ExchangeRemovedPaymentForCraftMessage.objectUID.")));
            };
        }


    }
}//package com.ankamagames.dofus.network.messages.game.inventory.exchanges

