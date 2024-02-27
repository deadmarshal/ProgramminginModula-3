MODULE Main;

IMPORT SIO;

TYPE 
  Person = OBJECT
    FirstName,LastName:TEXT;
    Age:CARDINAL;
    METHODS
      showPerson() := ShowPerson;
  END;

PROCEDURE ShowPerson(self:Person) =
  BEGIN
    SIO.PutText(self.FirstName & " " & self.LastName & "\n");
    SIO.PutInt(self.Age); SIO.Nl()
  END ShowPerson;

VAR 
  p1:Person := NIL;

BEGIN
  (*
    Object Oriented Programming consists of modeling the world through
    objects, which have some internal state(fields) and 
    behavior(methods). Objects can communicate with the world(other 
    objects) via sending and receiving messages. In OOP the procedure
    that processes a given message is called a method, is invisible
    to the outside, and it is the only way to access an object. 
    Before we hid the data in modules and passed it around in 
    procedures. In OOP the data and the methods(procedures) are bundled
    together in an encapsulated entity. Another important property of
    objects is extensibility. We can derive a new object from an 
    existing one, and add more fields and methods to it, in which case
    it forms a subclass of the original(superclass).
    Subclasses have an Is-a relationship to their superclass: each 
    object of a subclass is likewise an object of the corresponding
    superclass.
    If we take the class Vehicle, we can derive the classes Automobile
    and Truck. We can say that every Automobile or Truck is a Vehicle,
    but not vice versa. With the extensibility feature, we can add 
    additional features to the existing ones and also delay some 
    decisions for future. 
    In OOP, object consist of a set of object fields(instance variables)
    which define the state space of the object and methods, which 
    describe the behavior of the object. Objects have a type and 
    individual objects are instances of this type. Objects are 
    classified according to their class membership. Many languages,
    including Modula-3, have an absolute root class to which all objects
    belong per definition. 
    
    Encapsulation:
    Encapsulation is a fundamental feature of classes. A class interface
    should contain only messages(the signature of messages,i.e. their
    names and parameter list) and the fields must be hidden. Some 
    languages like Modula-3 don't restrict access to the fields
    by default. Classes(object types) have a dual role: they have
    clients on the one hand, and heirs(subclasses) on the other.
    Clients use the services of a class and have a uses relationship.
    The client of a class uses a class according to its inteface.
    The heirs(subclasses) inherit and extend the features of their
    superclasses. They need more knowledge of the inner structure of 
    a superclass than clients. Hence a class must present a somewhat
    more detailed interface for its subclasses than for its clients.
    
    Inheritance:
    A subclass inherits all features of its superclass and can extend
    the superclass. The subclasses normally extend the set of fields
    and methods of the superclass. Inheritance proves especially
    suited to specialization of a more general class. An automobile is a 
    specialization of vehicles; a convertible can be a specialization
    of an automobile. We can also define an abstract superclass Vehicle,
    which serves to allow us to derive concrete subclasses, such as 
    Sedan and Convertible. With the help of inheritance, we can produce
    a hierarchy of classes. 
    
    Polymorphism:
    We call variables that can take on various forms(can have different
    types) polymorphous. Procedures with polymorphous parameters are 
    called polymorphous procedures. Because an object of a subclass is
    also an object of its superclass, whereever an object of the 
    superclass can be used,we can use an object of a subclass instead -
    but not vice versa! This makes the object variables or parameters
    polymorphous. An object variable can change its type at run-time.
    We can assign a Truck instance to a Vehicle variable. Note that this
    is not the object instance that changes its type, but the variable
    that can contain references to various object instances. We call
    the actual type the dynamic type and the declared type the static
    type. Assignment is not permitted between objects if the dynamic
    type of the RHS expression is neither subtype nor a supertype of 
    the declared type of the LHS expression. For this reason, 
    polymorphism is restricted: Vehicle variables can't be assigned to
    Person objects. So assignments are possible only along the type 
    hierarchy that begins at the declared type.
    Methods are polymorphous procedures: they can be applied to any 
    object of a class hierarchy. For example, once we have defined a 
    method to determine the speed of vehicles,it can be applied to 
    automobiles,trucks,and convertibles. 
    
    Dynamic binding:
    A polymorphous procedure can be applied to objects of various 
    classes(within the same class hierarchy). Often we need to adapt
    an algorithm to accomodate the specific subclass. So we can 
    override methods. Overriding means exchanging the algorithm of a 
    method. If the Truck's or Sedan's speeds differ, they can override
    the corresponding method to determine the speed. The new method is
    invoked by the same message, but does something different according
    to the message that was sent to a Sedan or a Truck object.
    The dynamic binding mechanism guarantees that - depending on which
    subclass an object belongs to - the correct method is always 
    applied. Which method is actually invoked depends on the type of 
    the object. Thus the methods are not statically bound at 
    compile-time, but dynamically at run-time,when actual class 
    membership is available.
    
    Modula-3 offers the OBJECT type constructor which provides 
    inheritance,polymorphism, and dynamic binding features.
    
    Syntax of an object type:
    TYPE 
      Object = Super OBJECT
                 fields
                 METHODS
                   methods
                 OVERRIDES
                   overridden methods
               END;
    
    NOTE: if Super is not specified, it will be ROOT.
    
    NOTE: By default an object's fields are not hidden, 
    and can be accessed from outside the object. 
    To make the fields hidden, we have to hide them 
    in the interface file and reveal them in the implementation file.

    Subtyping rules for objects:
    ROOT <: REFANY
    UNTRACED ROOT <: ADDRESS
    NULL <: T OBJECT ... END <: T <: ROOT

    These definitions indicate that all objects are references. 
    All traced objects are subtypes of ROOT,the root of all
    object types. The type NULL is a subtype of every object type, 
    so that every object can assume the value NIL.

    As with references, traced objects are garbage collected 
    and untraced objects are not and must be deallocated in unsafe
    modules with DISPOSE().
  *)
  p1 := NEW(Person);
  p1.FirstName := "John";
  p1.LastName := "Doe";
  p1.Age := 30;
  p1.showPerson(); (* method invocation *)
END Main.
