﻿package com.ankamagames.dofus.network.messages.game.prism
{
    import com.ankamagames.jerakine.network.NetworkMessage;
    import com.ankamagames.jerakine.network.INetworkMessage;
    import flash.utils.ByteArray;
    import flash.utils.IDataOutput;
    import flash.utils.IDataInput;

    [Trusted]
    public class PrismFightDefendersSwapMessage extends NetworkMessage implements INetworkMessage 
    {

        public static const protocolId:uint = 5902;

        private var _isInitialized:Boolean = false;
        public var subAreaId:uint = 0;
        public var fightId:Number = 0;
        public var fighterId1:uint = 0;
        public var fighterId2:uint = 0;


        override public function get isInitialized():Boolean
        {
            return (this._isInitialized);
        }

        override public function getMessageId():uint
        {
            return (5902);
        }

        public function initPrismFightDefendersSwapMessage(subAreaId:uint=0, fightId:Number=0, fighterId1:uint=0, fighterId2:uint=0):PrismFightDefendersSwapMessage
        {
            this.subAreaId = subAreaId;
            this.fightId = fightId;
            this.fighterId1 = fighterId1;
            this.fighterId2 = fighterId2;
            this._isInitialized = true;
            return (this);
        }

        override public function reset():void
        {
            this.subAreaId = 0;
            this.fightId = 0;
            this.fighterId1 = 0;
            this.fighterId2 = 0;
            this._isInitialized = false;
        }

        override public function pack(output:IDataOutput):void
        {
            var data:ByteArray = new ByteArray();
            this.serialize(data);
            writePacket(output, this.getMessageId(), data);
        }

        override public function unpack(input:IDataInput, length:uint):void
        {
            this.deserialize(input);
        }

        public function serialize(output:IDataOutput):void
        {
            this.serializeAs_PrismFightDefendersSwapMessage(output);
        }

        public function serializeAs_PrismFightDefendersSwapMessage(output:IDataOutput):void
        {
            if (this.subAreaId < 0)
            {
                throw (new Error((("Forbidden value (" + this.subAreaId) + ") on element subAreaId.")));
            };
            output.writeShort(this.subAreaId);
            if ((((this.fightId < -9007199254740992)) || ((this.fightId > 9007199254740992))))
            {
                throw (new Error((("Forbidden value (" + this.fightId) + ") on element fightId.")));
            };
            output.writeDouble(this.fightId);
            if (this.fighterId1 < 0)
            {
                throw (new Error((("Forbidden value (" + this.fighterId1) + ") on element fighterId1.")));
            };
            output.writeInt(this.fighterId1);
            if (this.fighterId2 < 0)
            {
                throw (new Error((("Forbidden value (" + this.fighterId2) + ") on element fighterId2.")));
            };
            output.writeInt(this.fighterId2);
        }

        public function deserialize(input:IDataInput):void
        {
            this.deserializeAs_PrismFightDefendersSwapMessage(input);
        }

        public function deserializeAs_PrismFightDefendersSwapMessage(input:IDataInput):void
        {
            this.subAreaId = input.readShort();
            if (this.subAreaId < 0)
            {
                throw (new Error((("Forbidden value (" + this.subAreaId) + ") on element of PrismFightDefendersSwapMessage.subAreaId.")));
            };
            this.fightId = input.readDouble();
            if ((((this.fightId < -9007199254740992)) || ((this.fightId > 9007199254740992))))
            {
                throw (new Error((("Forbidden value (" + this.fightId) + ") on element of PrismFightDefendersSwapMessage.fightId.")));
            };
            this.fighterId1 = input.readInt();
            if (this.fighterId1 < 0)
            {
                throw (new Error((("Forbidden value (" + this.fighterId1) + ") on element of PrismFightDefendersSwapMessage.fighterId1.")));
            };
            this.fighterId2 = input.readInt();
            if (this.fighterId2 < 0)
            {
                throw (new Error((("Forbidden value (" + this.fighterId2) + ") on element of PrismFightDefendersSwapMessage.fighterId2.")));
            };
        }


    }
}//package com.ankamagames.dofus.network.messages.game.prism

