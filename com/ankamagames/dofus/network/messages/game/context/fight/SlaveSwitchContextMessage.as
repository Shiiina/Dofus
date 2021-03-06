﻿package com.ankamagames.dofus.network.messages.game.context.fight
{
    import com.ankamagames.jerakine.network.NetworkMessage;
    import com.ankamagames.jerakine.network.INetworkMessage;
    import __AS3__.vec.Vector;
    import com.ankamagames.dofus.network.types.game.data.items.SpellItem;
    import com.ankamagames.dofus.network.types.game.character.characteristic.CharacterCharacteristicsInformations;
    import com.ankamagames.dofus.network.types.game.shortcut.Shortcut;
    import flash.utils.ByteArray;
    import com.ankamagames.jerakine.network.CustomDataWrapper;
    import com.ankamagames.jerakine.network.ICustomDataOutput;
    import com.ankamagames.jerakine.network.ICustomDataInput;
    import com.ankamagames.dofus.network.ProtocolTypeManager;
    import __AS3__.vec.*;

    [Trusted]
    public class SlaveSwitchContextMessage extends NetworkMessage implements INetworkMessage 
    {

        public static const protocolId:uint = 6214;

        private var _isInitialized:Boolean = false;
        public var masterId:int = 0;
        public var slaveId:int = 0;
        public var slaveSpells:Vector.<SpellItem>;
        public var slaveStats:CharacterCharacteristicsInformations;
        public var shortcuts:Vector.<Shortcut>;

        public function SlaveSwitchContextMessage()
        {
            this.slaveSpells = new Vector.<SpellItem>();
            this.slaveStats = new CharacterCharacteristicsInformations();
            this.shortcuts = new Vector.<Shortcut>();
            super();
        }

        override public function get isInitialized():Boolean
        {
            return (this._isInitialized);
        }

        override public function getMessageId():uint
        {
            return (6214);
        }

        public function initSlaveSwitchContextMessage(masterId:int=0, slaveId:int=0, slaveSpells:Vector.<SpellItem>=null, slaveStats:CharacterCharacteristicsInformations=null, shortcuts:Vector.<Shortcut>=null):SlaveSwitchContextMessage
        {
            this.masterId = masterId;
            this.slaveId = slaveId;
            this.slaveSpells = slaveSpells;
            this.slaveStats = slaveStats;
            this.shortcuts = shortcuts;
            this._isInitialized = true;
            return (this);
        }

        override public function reset():void
        {
            this.masterId = 0;
            this.slaveId = 0;
            this.slaveSpells = new Vector.<SpellItem>();
            this.slaveStats = new CharacterCharacteristicsInformations();
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
            this.serializeAs_SlaveSwitchContextMessage(output);
        }

        public function serializeAs_SlaveSwitchContextMessage(output:ICustomDataOutput):void
        {
            output.writeInt(this.masterId);
            output.writeInt(this.slaveId);
            output.writeShort(this.slaveSpells.length);
            var _i3:uint;
            while (_i3 < this.slaveSpells.length)
            {
                (this.slaveSpells[_i3] as SpellItem).serializeAs_SpellItem(output);
                _i3++;
            };
            this.slaveStats.serializeAs_CharacterCharacteristicsInformations(output);
            output.writeShort(this.shortcuts.length);
            var _i5:uint;
            while (_i5 < this.shortcuts.length)
            {
                output.writeShort((this.shortcuts[_i5] as Shortcut).getTypeId());
                (this.shortcuts[_i5] as Shortcut).serialize(output);
                _i5++;
            };
        }

        public function deserialize(input:ICustomDataInput):void
        {
            this.deserializeAs_SlaveSwitchContextMessage(input);
        }

        public function deserializeAs_SlaveSwitchContextMessage(input:ICustomDataInput):void
        {
            var _item3:SpellItem;
            var _id5:uint;
            var _item5:Shortcut;
            this.masterId = input.readInt();
            this.slaveId = input.readInt();
            var _slaveSpellsLen:uint = input.readUnsignedShort();
            var _i3:uint;
            while (_i3 < _slaveSpellsLen)
            {
                _item3 = new SpellItem();
                _item3.deserialize(input);
                this.slaveSpells.push(_item3);
                _i3++;
            };
            this.slaveStats = new CharacterCharacteristicsInformations();
            this.slaveStats.deserialize(input);
            var _shortcutsLen:uint = input.readUnsignedShort();
            var _i5:uint;
            while (_i5 < _shortcutsLen)
            {
                _id5 = input.readUnsignedShort();
                _item5 = ProtocolTypeManager.getInstance(Shortcut, _id5);
                _item5.deserialize(input);
                this.shortcuts.push(_item5);
                _i5++;
            };
        }


    }
}//package com.ankamagames.dofus.network.messages.game.context.fight

