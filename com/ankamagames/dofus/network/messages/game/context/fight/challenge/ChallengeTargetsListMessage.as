﻿package com.ankamagames.dofus.network.messages.game.context.fight.challenge
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
    public class ChallengeTargetsListMessage extends NetworkMessage implements INetworkMessage 
    {

        public static const protocolId:uint = 5613;

        private var _isInitialized:Boolean = false;
        public var targetIds:Vector.<int>;
        public var targetCells:Vector.<int>;

        public function ChallengeTargetsListMessage()
        {
            this.targetIds = new Vector.<int>();
            this.targetCells = new Vector.<int>();
            super();
        }

        override public function get isInitialized():Boolean
        {
            return (this._isInitialized);
        }

        override public function getMessageId():uint
        {
            return (5613);
        }

        public function initChallengeTargetsListMessage(targetIds:Vector.<int>=null, targetCells:Vector.<int>=null):ChallengeTargetsListMessage
        {
            this.targetIds = targetIds;
            this.targetCells = targetCells;
            this._isInitialized = true;
            return (this);
        }

        override public function reset():void
        {
            this.targetIds = new Vector.<int>();
            this.targetCells = new Vector.<int>();
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
            this.serializeAs_ChallengeTargetsListMessage(output);
        }

        public function serializeAs_ChallengeTargetsListMessage(output:ICustomDataOutput):void
        {
            output.writeShort(this.targetIds.length);
            var _i1:uint;
            while (_i1 < this.targetIds.length)
            {
                output.writeInt(this.targetIds[_i1]);
                _i1++;
            };
            output.writeShort(this.targetCells.length);
            var _i2:uint;
            while (_i2 < this.targetCells.length)
            {
                if ((((this.targetCells[_i2] < -1)) || ((this.targetCells[_i2] > 559))))
                {
                    throw (new Error((("Forbidden value (" + this.targetCells[_i2]) + ") on element 2 (starting at 1) of targetCells.")));
                };
                output.writeShort(this.targetCells[_i2]);
                _i2++;
            };
        }

        public function deserialize(input:ICustomDataInput):void
        {
            this.deserializeAs_ChallengeTargetsListMessage(input);
        }

        public function deserializeAs_ChallengeTargetsListMessage(input:ICustomDataInput):void
        {
            var _val1:int;
            var _val2:int;
            var _targetIdsLen:uint = input.readUnsignedShort();
            var _i1:uint;
            while (_i1 < _targetIdsLen)
            {
                _val1 = input.readInt();
                this.targetIds.push(_val1);
                _i1++;
            };
            var _targetCellsLen:uint = input.readUnsignedShort();
            var _i2:uint;
            while (_i2 < _targetCellsLen)
            {
                _val2 = input.readShort();
                if ((((_val2 < -1)) || ((_val2 > 559))))
                {
                    throw (new Error((("Forbidden value (" + _val2) + ") on elements of targetCells.")));
                };
                this.targetCells.push(_val2);
                _i2++;
            };
        }


    }
}//package com.ankamagames.dofus.network.messages.game.context.fight.challenge

