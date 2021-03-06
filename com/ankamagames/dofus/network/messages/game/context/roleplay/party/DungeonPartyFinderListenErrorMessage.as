﻿package com.ankamagames.dofus.network.messages.game.context.roleplay.party
{
    import com.ankamagames.jerakine.network.NetworkMessage;
    import com.ankamagames.jerakine.network.INetworkMessage;
    import flash.utils.ByteArray;
    import com.ankamagames.jerakine.network.CustomDataWrapper;
    import com.ankamagames.jerakine.network.ICustomDataOutput;
    import com.ankamagames.jerakine.network.ICustomDataInput;

    [Trusted]
    public class DungeonPartyFinderListenErrorMessage extends NetworkMessage implements INetworkMessage 
    {

        public static const protocolId:uint = 6248;

        private var _isInitialized:Boolean = false;
        public var dungeonId:uint = 0;


        override public function get isInitialized():Boolean
        {
            return (this._isInitialized);
        }

        override public function getMessageId():uint
        {
            return (6248);
        }

        public function initDungeonPartyFinderListenErrorMessage(dungeonId:uint=0):DungeonPartyFinderListenErrorMessage
        {
            this.dungeonId = dungeonId;
            this._isInitialized = true;
            return (this);
        }

        override public function reset():void
        {
            this.dungeonId = 0;
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
            this.serializeAs_DungeonPartyFinderListenErrorMessage(output);
        }

        public function serializeAs_DungeonPartyFinderListenErrorMessage(output:ICustomDataOutput):void
        {
            if (this.dungeonId < 0)
            {
                throw (new Error((("Forbidden value (" + this.dungeonId) + ") on element dungeonId.")));
            };
            output.writeVarShort(this.dungeonId);
        }

        public function deserialize(input:ICustomDataInput):void
        {
            this.deserializeAs_DungeonPartyFinderListenErrorMessage(input);
        }

        public function deserializeAs_DungeonPartyFinderListenErrorMessage(input:ICustomDataInput):void
        {
            this.dungeonId = input.readVarUhShort();
            if (this.dungeonId < 0)
            {
                throw (new Error((("Forbidden value (" + this.dungeonId) + ") on element of DungeonPartyFinderListenErrorMessage.dungeonId.")));
            };
        }


    }
}//package com.ankamagames.dofus.network.messages.game.context.roleplay.party

