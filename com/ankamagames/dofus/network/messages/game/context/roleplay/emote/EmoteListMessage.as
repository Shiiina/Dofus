﻿package com.ankamagames.dofus.network.messages.game.context.roleplay.emote
{
    import com.ankamagames.jerakine.network.NetworkMessage;
    import com.ankamagames.jerakine.network.INetworkMessage;
    import __AS3__.vec.Vector;
    import flash.utils.ByteArray;
    import com.ankamagames.jerakine.network.CustomDataWrapper;
    import com.ankamagames.jerakine.network.ICustomDataOutput;
    import com.ankamagames.jerakine.network.ICustomDataInput;
    import __AS3__.vec.*;

    [Trusted]
    public class EmoteListMessage extends NetworkMessage implements INetworkMessage 
    {

        public static const protocolId:uint = 5689;

        private var _isInitialized:Boolean = false;
        public var emoteIds:Vector.<uint>;

        public function EmoteListMessage()
        {
            this.emoteIds = new Vector.<uint>();
            super();
        }

        override public function get isInitialized():Boolean
        {
            return (this._isInitialized);
        }

        override public function getMessageId():uint
        {
            return (5689);
        }

        public function initEmoteListMessage(emoteIds:Vector.<uint>=null):EmoteListMessage
        {
            this.emoteIds = emoteIds;
            this._isInitialized = true;
            return (this);
        }

        override public function reset():void
        {
            this.emoteIds = new Vector.<uint>();
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
            this.serializeAs_EmoteListMessage(output);
        }

        public function serializeAs_EmoteListMessage(output:ICustomDataOutput):void
        {
            output.writeShort(this.emoteIds.length);
            var _i1:uint;
            while (_i1 < this.emoteIds.length)
            {
                if ((((this.emoteIds[_i1] < 0)) || ((this.emoteIds[_i1] > 0xFF))))
                {
                    throw (new Error((("Forbidden value (" + this.emoteIds[_i1]) + ") on element 1 (starting at 1) of emoteIds.")));
                };
                output.writeByte(this.emoteIds[_i1]);
                _i1++;
            };
        }

        public function deserialize(input:ICustomDataInput):void
        {
            this.deserializeAs_EmoteListMessage(input);
        }

        public function deserializeAs_EmoteListMessage(input:ICustomDataInput):void
        {
            var _val1:uint;
            var _emoteIdsLen:uint = input.readUnsignedShort();
            var _i1:uint;
            while (_i1 < _emoteIdsLen)
            {
                _val1 = input.readUnsignedByte();
                if ((((_val1 < 0)) || ((_val1 > 0xFF))))
                {
                    throw (new Error((("Forbidden value (" + _val1) + ") on elements of emoteIds.")));
                };
                this.emoteIds.push(_val1);
                _i1++;
            };
        }


    }
}//package com.ankamagames.dofus.network.messages.game.context.roleplay.emote

