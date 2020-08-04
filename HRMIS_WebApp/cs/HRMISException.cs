using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace HRWebApp.cs
{
    public class HRMISException:Exception
    {
        public HRMISException() { }
        public HRMISException(string message) : base(message) { }
        public HRMISException(string message, Exception inner) : base(message, inner) { }
    }
}