﻿package com.ankamagames.dofus.network.messages.game.inventory.items
{
    import com.ankamagames.jerakine.network.NetworkMessage;
    import com.ankamagames.jerakine.network.INetworkMessage;
    import flash.utils.ByteArray;
    import com.ankamagames.jerakine.network.CustomDataWrapper;
    import com.ankamagames.jerakine.network.ICustomDataOutput;
    import com.ankamagames.jerakine.network.ICustomDataInput;

    [Trusted]
    public class ExchangeMultiCraftSetCrafterCanUseHisRessourcesMessage extends NetworkMessage implements INetworkMessage 
    {

        public static const protocolId:uint = 6021;

        private var _isInitialized:Boolean = false;
        public var allow:Boolean = false;


        override public function get isInitialized():Boolean
        {
            return (this._isInitialized);
        }

        override public function getMessageId():uint
        {
            return (6021);
        }

        public function initExchangeMultiCraftSetCrafterCanUseHisRessourcesMessage(allow:Boolean=false):ExchangeMultiCraftSetCrafterCanUseHisRessourcesMessage
        {
            this.allow = allow;
            this._isInitialized = true;
            return (this);
        }

        override public function reset():void
        {
            this.allow = false;
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
            this.serializeAs_ExchangeMultiCraftSetCrafterCanUseHisRessourcesMessage(output);
        }

        public function serializeAs_ExchangeMultiCraftSetCrafterCanUseHisRessourcesMessage(output:ICustomDataOutput):void
        {
            output.writeBoolean(this.allow);
        }

        public function deserialize(input:ICustomDataInput):void
        {
            this.deserializeAs_ExchangeMultiCraftSetCrafterCanUseHisRessourcesMessage(input);
        }

        public function deserializeAs_ExchangeMultiCraftSetCrafterCanUseHisRessourcesMessage(input:ICustomDataInput):void
        {
            this.allow = input.readBoolean();
        }


    }
}//package com.ankamagames.dofus.network.messages.game.inventory.items

