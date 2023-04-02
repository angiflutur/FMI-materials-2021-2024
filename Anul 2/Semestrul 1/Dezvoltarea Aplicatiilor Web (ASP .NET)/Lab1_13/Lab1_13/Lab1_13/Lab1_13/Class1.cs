using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Lab1_13
{
    public class Class1 : Interface1
    {
        public string CompleteName
        {
            get { return FirstName + " " + LastName; }
            set { CompleteName = value; }
        }
        public string FirstName { get; set; }
        public string LastName { get; set; }

        public string Description1 { get; set; }
        protected internal string Description2 { get; set; }
        protected string Description3 { get; set; }

        internal string Description4 { get; set; }
        private protected string Description5 { get; set;}

        private  string Description6 { get; set; }

        [Obsolete("Please use Method 2")]
        public void Method1()
        {
            Console.WriteLine("Method 1");
        }

        public void Method2()
        {
            Console.WriteLine("Method 2");
        }
    }
}
