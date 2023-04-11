public with sharing class WrapperExp1 {
    //data, support==

    public Datawrapper data;
    public SupportWrapper support;

        public class Datawrapper{
          public  integer id;
          public  string email;
         public   string first_name;
         public   string last_name;
          public  string avatar;
        }

        public class SupportWrapper{
            public string url;
            public string text;
        }
   
}