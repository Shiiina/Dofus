﻿package com.ankamagames.dofus.network.messages.game.inventory.exchanges
{
    import com.ankamagames.jerakine.network.INetworkMessage;
    import __AS3__.vec.Vector;
    import flash.utils.ByteArray;
    import com.ankamagames.jerakine.network.CustomDataWrapper;
    import com.ankamagames.jerakine.network.ICustomDataOutput;
    import com.ankamagames.jerakine.network.ICustomDataInput;
    import __AS3__.vec.*;

    [Trusted]
    public class ExchangeBidPriceForSellerMessage extends ExchangeBidPriceMessage implements INetworkMessage 
    {

        public static const protocolId:uint = 6464;

        private var _isInitialized:Boolean = false;
        public var allIdentical:Boolean = false;
        public var minimalPrices:Vector.<uint>;

        public function ExchangeBidPriceForSellerMessage()
        {
            this.minimalPrices = new Vector.<uint>();
            super();
        }

        override public function get isInitialized():Boolean
        {
            return (((super.isInitialized) && (this._isInitialized)));
        }

        override public function getMessageId():uint
        {
            return (6464);
        }

        public function initExchangeBidPriceForSellerMessage(genericId:uint=0, averagePrice:int=0, allIdentical:Boolean=false, minimalPrices:Vector.<uint>=null):ExchangeBidPriceForSellerMessage
        {
            super.initExchangeBidPriceMessage(genericId, averagePrice);
            this.allIdentical = allIdentical;
            this.minimalPrices = minimalPrices;
            this._isInitialized = true;
            return (this);
        }

        override public function reset():void
        {
            super.reset();
            this.allIdentical = false;
            this.minimalPrices = new Vector.<uint>();
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
            this.serializeAs_ExchangeBidPriceForSellerMessage(output);
        }

        public function serializeAs_ExchangeBidPriceForSellerMessage(output:ICustomDataOutput):void
        {
            super.serializeAs_ExchangeBidPriceMessage(output);
            output.writeBoolean(this.allIdentical);
            output.writeShort(this.minimalPrices.length);
            var _i2:uint;
            while (_i2 < this.minimalPrices.length)
            {
                if (this.minimalPrices[_i2] < 0)
                {
                    throw (new Error((("Forbidden value (" + this.minimalPrices[_i2]) + ") on element 2 (starting at 1) of minimalPrices.")));
                };
                output.writeVarInt(this.minimalPrices[_i2]);
                _i2++;
            };
        }

        override public function deserialize(input:ICustomDataInput):void
        {
            this.deserializeAs_ExchangeBidPriceForSellerMessage(input);
        }

        public function deserializeAs_ExchangeBidPriceForSellerMessage(input:ICustomDataInput):void
        {
            var _val2:uint;
            super.deserialize(input);
            this.allIdentical = input.readBoolean();
            var _minimalPricesLen:uint = input.readUnsignedShort();
            var _i2:uint;
            while (_i2 < _minimalPricesLen)
            {
                _val2 = input.readVarUhInt();
                if (_val2 < 0)
                {
                    throw (new Error((("Forbidden value (" + _val2) + ") on elements of minimalPrices.")));
                };
                this.minimalPrices.push(_val2);
                _i2++;
            };
        }


    }
}//package com.ankamagames.dofus.network.messages.game.inventory.exchanges

