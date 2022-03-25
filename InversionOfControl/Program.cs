using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace InversionOfControl
{
    public interface IEvents
    {
        void GetLoadEvents();
    }
    class College
    {
        public IEvents _events;
        //public College(IEvents events)
        //{

        //    _events = events;
        //}
        /// <summary>
        /// property 
        /// </summary>
        /// <param name="args"></param>
        //public IEvents MyEvent
        //{
        //    set { _events = value; }
        //    get { return _events; }

        //}

        public void GetTodayEvent(IEvents events)
        {
            events.GetLoadEvents();
        }

        static void Main(string[] args)
        {
            // College obj = new College(new TechnicalEvents());
            College obj = new College();
            //obj._events.GetLoadEvents();
            //obj.MyEvent = new TechnicalEvents();
            //obj.MyEvent.GetLoadEvents();
            obj.GetTodayEvent(new TechnicalEvents());
            Console.ReadLine();
        }
    }

    public class TechnicalEvents:IEvents
    {
        public void GetLoadEvents()
        {
            Console.WriteLine("Technical Event is started");
        }

    }


    public class SportsEvents : IEvents
    {
        public void GetLoadEvents()
        {
            Console.WriteLine("Sports Event is started");
        }

    }
}
