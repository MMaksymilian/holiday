package flex.admin
{
  public class Contact extends Object {
    [Bindable]
    public var firstName:String;
    [Bindable]
    public var lastName:String;
    [Bindable]
    public var jobTitle:String;
    [Bindable]
    public var notes:String;

    
    public function Contact(fn:String, ln:String, jt:String, n:String) {
      super();
      firstName = fn;
      lastName = ln;
      jobTitle = jt;
      notes = n;
    } 
  }
}