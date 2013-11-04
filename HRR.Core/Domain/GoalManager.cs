﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using HRR.Core.Domain.Interfaces;
using System.Runtime.Serialization;
using Newtonsoft.Json;

namespace HRR.Core.Domain
{
    [Serializable]
    [DataContract]
    public class GoalManager : IGoalManager
    {
        [DataMember]
        public virtual int ID { get; set; }
        [DataMember]
        public virtual string Name { get; set; }
        public virtual ItemType TypeOfItem { get; set; }
        public virtual object ItemReference { get; set; }
        [DataMember]
        public virtual int GoalID { get; set; }
        [DataMember]
        public virtual int PersonID { get; set; }
        [DataMember]
        public virtual bool RecievesNotifications { get; set; }
        [DataMember]
        public virtual Person PersonRef { get; set; }
        [DataMember]
        public virtual Goal GoalRef { get; set; }

        public GoalManager()
        {
            this.TypeOfItem = ItemType.GOAL_MANAGER;
        }

        public virtual string ToJSON()
        {
            return JsonConvert.SerializeObject(this);
        }
    }
}
