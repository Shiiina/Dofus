﻿package com.ankamagames.dofus.network.types.game.character
{
    import com.ankamagames.jerakine.network.INetworkType;
    import com.ankamagames.dofus.network.types.game.context.roleplay.BasicGuildInformations;
    import com.ankamagames.dofus.network.types.game.look.EntityLook;
    import com.ankamagames.jerakine.network.ICustomDataOutput;
    import com.ankamagames.jerakine.network.ICustomDataInput;

    public class CharacterMinimalGuildInformations extends CharacterMinimalPlusLookInformations implements INetworkType 
    {

        public static const protocolId:uint = 445;

        public var guild:BasicGuildInformations;

        public function CharacterMinimalGuildInformations()
        {
            this.guild = new BasicGuildInformations();
            super();
        }

        override public function getTypeId():uint
        {
            return (445);
        }

        public function initCharacterMinimalGuildInformations(id:uint=0, level:uint=0, name:String="", entityLook:EntityLook=null, guild:BasicGuildInformations=null):CharacterMinimalGuildInformations
        {
            super.initCharacterMinimalPlusLookInformations(id, level, name, entityLook);
            this.guild = guild;
            return (this);
        }

        override public function reset():void
        {
            super.reset();
            this.guild = new BasicGuildInformations();
        }

        override public function serialize(output:ICustomDataOutput):void
        {
            this.serializeAs_CharacterMinimalGuildInformations(output);
        }

        public function serializeAs_CharacterMinimalGuildInformations(output:ICustomDataOutput):void
        {
            super.serializeAs_CharacterMinimalPlusLookInformations(output);
            this.guild.serializeAs_BasicGuildInformations(output);
        }

        override public function deserialize(input:ICustomDataInput):void
        {
            this.deserializeAs_CharacterMinimalGuildInformations(input);
        }

        public function deserializeAs_CharacterMinimalGuildInformations(input:ICustomDataInput):void
        {
            super.deserialize(input);
            this.guild = new BasicGuildInformations();
            this.guild.deserialize(input);
        }


    }
}//package com.ankamagames.dofus.network.types.game.character

