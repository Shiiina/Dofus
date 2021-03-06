﻿package com.ankamagames.dofus.network.messages.game.context.roleplay.emote
{
    import com.ankamagames.jerakine.network.INetworkMessage;
    import __AS3__.vec.Vector;
    import flash.utils.ByteArray;
    import com.ankamagames.jerakine.network.CustomDataWrapper;
    import com.ankamagames.jerakine.network.ICustomDataOutput;
    import com.ankamagames.jerakine.network.ICustomDataInput;
    import __AS3__.vec.*;

    [Trusted]
    public class EmotePlayMassiveMessage extends EmotePlayAbstractMessage implements INetworkMessage 
    {

        public static const protocolId:uint = 5691;

        private var _isInitialized:Boolean = false;
        public var actorIds:Vector.<int>;

        public function EmotePlayMassiveMessage()
        {
            this.actorIds = new Vector.<int>();
            super();
        }

        override public function get isInitialized():Boolean
        {
            return (((super.isInitialized) && (this._isInitialized)));
        }

        override public function getMessageId():uint
        {
            return (5691);
        }

        public function initEmotePlayMassiveMessage(emoteId:uint=0, emoteStartTime:Number=0, actorIds:Vector.<int>=null):EmotePlayMassiveMessage
        {
            super.initEmotePlayAbstractMessage(emoteId, emoteStartTime);
            this.actorIds = actorIds;
            this._isInitialized = true;
            return (this);
        }

        override public function reset():void
        {
            super.reset();
            this.actorIds = new Vector.<int>();
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
            this.serializeAs_EmotePlayMassiveMessage(output);
        }

        public function serializeAs_EmotePlayMassiveMessage(output:ICustomDataOutput):void
        {
            super.serializeAs_EmotePlayAbstractMessage(output);
            output.writeShort(this.actorIds.length);
            var _i1:uint;
            while (_i1 < this.actorIds.length)
            {
                output.writeInt(this.actorIds[_i1]);
                _i1++;
            };
        }

        override public function deserialize(input:ICustomDataInput):void
        {
            this.deserializeAs_EmotePlayMassiveMessage(input);
        }

        public function deserializeAs_EmotePlayMassiveMessage(input:ICustomDataInput):void
        {
            var _val1:int;
            super.deserialize(input);
            var _actorIdsLen:uint = input.readUnsignedShort();
            var _i1:uint;
            while (_i1 < _actorIdsLen)
            {
                _val1 = input.readInt();
                this.actorIds.push(_val1);
                _i1++;
            };
        }


    }
}//package com.ankamagames.dofus.network.messages.game.context.roleplay.emote

