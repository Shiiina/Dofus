﻿package com.ankamagames.dofus.network.messages.game.shortcut
{
    import com.ankamagames.jerakine.network.NetworkMessage;
    import com.ankamagames.jerakine.network.INetworkMessage;
    import flash.utils.ByteArray;
    import com.ankamagames.jerakine.network.CustomDataWrapper;
    import com.ankamagames.jerakine.network.ICustomDataOutput;
    import com.ankamagames.jerakine.network.ICustomDataInput;

    [Trusted]
    public class ShortcutBarRemoveErrorMessage extends NetworkMessage implements INetworkMessage 
    {

        public static const protocolId:uint = 6222;

        private var _isInitialized:Boolean = false;
        public var error:uint = 0;


        override public function get isInitialized():Boolean
        {
            return (this._isInitialized);
        }

        override public function getMessageId():uint
        {
            return (6222);
        }

        public function initShortcutBarRemoveErrorMessage(error:uint=0):ShortcutBarRemoveErrorMessage
        {
            this.error = error;
            this._isInitialized = true;
            return (this);
        }

        override public function reset():void
        {
            this.error = 0;
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
            this.serializeAs_ShortcutBarRemoveErrorMessage(output);
        }

        public function serializeAs_ShortcutBarRemoveErrorMessage(output:ICustomDataOutput):void
        {
            output.writeByte(this.error);
        }

        public function deserialize(input:ICustomDataInput):void
        {
            this.deserializeAs_ShortcutBarRemoveErrorMessage(input);
        }

        public function deserializeAs_ShortcutBarRemoveErrorMessage(input:ICustomDataInput):void
        {
            this.error = input.readByte();
            if (this.error < 0)
            {
                throw (new Error((("Forbidden value (" + this.error) + ") on element of ShortcutBarRemoveErrorMessage.error.")));
            };
        }


    }
}//package com.ankamagames.dofus.network.messages.game.shortcut

