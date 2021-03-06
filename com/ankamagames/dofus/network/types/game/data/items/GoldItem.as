﻿package com.ankamagames.dofus.network.types.game.data.items
{
    import com.ankamagames.jerakine.network.INetworkType;
    import com.ankamagames.jerakine.network.ICustomDataOutput;
    import com.ankamagames.jerakine.network.ICustomDataInput;

    public class GoldItem extends Item implements INetworkType 
    {

        public static const protocolId:uint = 123;

        public var sum:uint = 0;


        override public function getTypeId():uint
        {
            return (123);
        }

        public function initGoldItem(sum:uint=0):GoldItem
        {
            this.sum = sum;
            return (this);
        }

        override public function reset():void
        {
            this.sum = 0;
        }

        override public function serialize(output:ICustomDataOutput):void
        {
            this.serializeAs_GoldItem(output);
        }

        public function serializeAs_GoldItem(output:ICustomDataOutput):void
        {
            super.serializeAs_Item(output);
            if (this.sum < 0)
            {
                throw (new Error((("Forbidden value (" + this.sum) + ") on element sum.")));
            };
            output.writeVarInt(this.sum);
        }

        override public function deserialize(input:ICustomDataInput):void
        {
            this.deserializeAs_GoldItem(input);
        }

        public function deserializeAs_GoldItem(input:ICustomDataInput):void
        {
            super.deserialize(input);
            this.sum = input.readVarUhInt();
            if (this.sum < 0)
            {
                throw (new Error((("Forbidden value (" + this.sum) + ") on element of GoldItem.sum.")));
            };
        }


    }
}//package com.ankamagames.dofus.network.types.game.data.items

