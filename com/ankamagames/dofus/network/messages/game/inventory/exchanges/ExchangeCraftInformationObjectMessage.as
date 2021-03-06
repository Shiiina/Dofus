﻿package com.ankamagames.dofus.network.messages.game.inventory.exchanges
{
    import com.ankamagames.jerakine.network.INetworkMessage;
    import flash.utils.ByteArray;
    import com.ankamagames.jerakine.network.CustomDataWrapper;
    import com.ankamagames.jerakine.network.ICustomDataOutput;
    import com.ankamagames.jerakine.network.ICustomDataInput;

    [Trusted]
    public class ExchangeCraftInformationObjectMessage extends ExchangeCraftResultWithObjectIdMessage implements INetworkMessage 
    {

        public static const protocolId:uint = 5794;

        private var _isInitialized:Boolean = false;
        public var playerId:uint = 0;


        override public function get isInitialized():Boolean
        {
            return (((super.isInitialized) && (this._isInitialized)));
        }

        override public function getMessageId():uint
        {
            return (5794);
        }

        public function initExchangeCraftInformationObjectMessage(craftResult:uint=0, objectGenericId:uint=0, playerId:uint=0):ExchangeCraftInformationObjectMessage
        {
            super.initExchangeCraftResultWithObjectIdMessage(craftResult, objectGenericId);
            this.playerId = playerId;
            this._isInitialized = true;
            return (this);
        }

        override public function reset():void
        {
            super.reset();
            this.playerId = 0;
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

        override public function serialize(output:ICustomDataOutput):void
        {
            this.serializeAs_ExchangeCraftInformationObjectMessage(output);
        }

        public function serializeAs_ExchangeCraftInformationObjectMessage(output:ICustomDataOutput):void
        {
            super.serializeAs_ExchangeCraftResultWithObjectIdMessage(output);
            if (this.playerId < 0)
            {
                throw (new Error((("Forbidden value (" + this.playerId) + ") on element playerId.")));
            };
            output.writeVarInt(this.playerId);
        }

        override public function deserialize(input:ICustomDataInput):void
        {
            this.deserializeAs_ExchangeCraftInformationObjectMessage(input);
        }

        public function deserializeAs_ExchangeCraftInformationObjectMessage(input:ICustomDataInput):void
        {
            super.deserialize(input);
            this.playerId = input.readVarUhInt();
            if (this.playerId < 0)
            {
                throw (new Error((("Forbidden value (" + this.playerId) + ") on element of ExchangeCraftInformationObjectMessage.playerId.")));
            };
        }


    }
}//package com.ankamagames.dofus.network.messages.game.inventory.exchanges

