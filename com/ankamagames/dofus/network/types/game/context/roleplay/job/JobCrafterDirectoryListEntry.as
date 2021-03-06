﻿package com.ankamagames.dofus.network.types.game.context.roleplay.job
{
    import com.ankamagames.jerakine.network.INetworkType;
    import com.ankamagames.jerakine.network.ICustomDataOutput;
    import com.ankamagames.jerakine.network.ICustomDataInput;

    public class JobCrafterDirectoryListEntry implements INetworkType 
    {

        public static const protocolId:uint = 196;

        public var playerInfo:JobCrafterDirectoryEntryPlayerInfo;
        public var jobInfo:JobCrafterDirectoryEntryJobInfo;

        public function JobCrafterDirectoryListEntry()
        {
            this.playerInfo = new JobCrafterDirectoryEntryPlayerInfo();
            this.jobInfo = new JobCrafterDirectoryEntryJobInfo();
            super();
        }

        public function getTypeId():uint
        {
            return (196);
        }

        public function initJobCrafterDirectoryListEntry(playerInfo:JobCrafterDirectoryEntryPlayerInfo=null, jobInfo:JobCrafterDirectoryEntryJobInfo=null):JobCrafterDirectoryListEntry
        {
            this.playerInfo = playerInfo;
            this.jobInfo = jobInfo;
            return (this);
        }

        public function reset():void
        {
            this.playerInfo = new JobCrafterDirectoryEntryPlayerInfo();
        }

        public function serialize(output:ICustomDataOutput):void
        {
            this.serializeAs_JobCrafterDirectoryListEntry(output);
        }

        public function serializeAs_JobCrafterDirectoryListEntry(output:ICustomDataOutput):void
        {
            this.playerInfo.serializeAs_JobCrafterDirectoryEntryPlayerInfo(output);
            this.jobInfo.serializeAs_JobCrafterDirectoryEntryJobInfo(output);
        }

        public function deserialize(input:ICustomDataInput):void
        {
            this.deserializeAs_JobCrafterDirectoryListEntry(input);
        }

        public function deserializeAs_JobCrafterDirectoryListEntry(input:ICustomDataInput):void
        {
            this.playerInfo = new JobCrafterDirectoryEntryPlayerInfo();
            this.playerInfo.deserialize(input);
            this.jobInfo = new JobCrafterDirectoryEntryJobInfo();
            this.jobInfo.deserialize(input);
        }


    }
}//package com.ankamagames.dofus.network.types.game.context.roleplay.job

