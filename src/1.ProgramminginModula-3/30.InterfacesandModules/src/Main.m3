MODULE Main;

IMPORT SIO,Fraction;
FROM SIO IMPORT PutInt,PutChar,Nl;

VAR
  a,b,c,d:Fraction.T;
  
BEGIN
  (*
    A module is an enclosed functional unit that solves part of
    the overall task. Each module has at least one interface to
    the outside. With modules, we can decompose large programs
    into parts that pose smaller problems and that we compose
    into a program.
    Module properties:
    1) Modules have an interface:
    Only things that appeat in the interface are available to the
    clients of a module. Everything else is invisible to the client
    and syntactically inaccessible.
    2) Modules have a memory:
    Unlike local procedure variables, variables declared withing
    a modules retain their values during the entire program execution.
    We can use these variables to store some state, and restrict the
    difficulties created by global variables to a small scope because
    these variables are not accessible from outside the module.
    3) The usage of modules can be checked:
    The compiler can check that all variables are used in accordance
    with their types, and the parameters of a procedure invocation
    match the procedure, and that everything used has been defined.
    4) Modularization reveals dependencies between program parts:
    The interface of a module must be imported explicitly by its client,
    which facilitates the understanding of the dependencies between
    program components.
    5) Modules are reusable:
    We can package solutions needed by multiple projects in module
    collections(libraries) and then they can be incorporated into
    various programs.
    6) Information hiding:
    Modules collect related algorithms(or procedures) and data
    structures. Because modules have an internal state, they can
    remember things between procedure invocations. The inferface
    assures that clients have all necessary information to control
    the functionality of the module; clients have no other form
    of access to the state of a module. This is called information
    hiding. Both algorithms and data are provided to the client
    not directly, but only in part, insofar as necessary, via
    the interface. As long as we don't modify the interface of
    a module, we can change and improve the internal structure of
    the module.
    7) State space:
    We term the current value of a variable its state, and the possible
    values of all variables are the state space of the program.
    Local variables don't change the global state space.
    Modules allow us to subdivide the global state space.
  *)

  (*
    Module structure:
    A module has an interface and an implementation file. Everything
    put in an interface is exported and accessible to clients.
    The implementation file is the actual realization(code) of the
    interface and is internal to the implementor.

    Interface syntax:
    [UNSAFE] INTERFACE Id;
    IMPORT ...;
    .
    .
    .
    END Id.

    Unlike modules, interfaces have no statement part, and can
    contain type,constant,variable, and procedure declarations:
    1) Type declarations:
    They allow a client to make variables of the types that the
    module provides.
    2) Procedure declarations:
    Only the procedure head must appear in the interface, and this
    suffices for the client to call them.
    3) Constant and variable declarations:
    Variables can be read and written by both the implementor and
    the clients. Constants can only be read of course.
    NOTE: Variables are seldom exported, instead one should use
    procedures to return and/or set their value, and make the variable
    hidden in the module, as to have better control over its use.
    NOTE: The keyword UNSAFE designates an unsafe interface which
    permit additional language features and disable certain compiler
    checks and is used for more low-level programming.
    (We'll talk about it later).

    Module syntax:
    [UNSAFE] MODULE Id EXPORTS Identifier_list;
    IMPORT ...;
    .
    .
    .
    BEGIN
    .
    .
    .
    END Id.

    An implementation module of an interface must export the interface
    using the EXPORTS statement after the name of the module.
    The Main module is a special module that is a runnable program.
    If a module exports the Main interface, then that module is
    taken to be the runnable program(this can be used to change our
    Main module name to something else).
    The EXPORTS statement can be omitted, in which case the module
    is the implementation for the interface of the same name.

    We can export multiple interfaces, creating multiple entries
    to the module. This allows for example to separate write operations
    from read operations. Then we provide the interface for the write
    operations only to privileged clients, whie the read operations
    are generally accessible.
    All identifiers declared in these multiple interfaces must be
    distinct. One exception is that procedure names can occur in
    multiple interfaces of a module. This allows us to set default
    values of parameters of a procedure differently in the read
    interface from those in the write interface. On the other hand,
    several modules can export the same interface. This allows
    distribuiting the implementation of a complex system with a
    simple interface across multiple modules.
    The compiler and linker check whether exactly one implementation
    (in one of the implementation modules) corresponds to each
    exported procedure.
    In any case, all declarations of the interfaces are visible to
    the exporting modules. 
    The statement part of an implementation module handles initializations;
    it is executed only once at the start of the program.    
    Imported modules are always initialized before importing modules.
    Cyclical imports(module A imports an interface from module B and
    vice versa) means that we can't rely on the above initialization
    sequence, and it is forbidden. (cyclical imports means poor
    design!)

    Compilation units:
    Both interface and implementation can be spread across multiple
    source code files. It's even possible that a module consists of
    only an interface, if it only exports type declarations and
    no procedures. Each source code file forms a compilation unit
    that can be processed by itself by the compiler.

    Using modules:
    The IMPORT statement either lists only the names of the imported
    modules or completely specifies all identifiers of the procedures,
    constants, types and variables that we want to use from an imported
    module.

    IMPORT Id FROM Identifier_list;
    or
    IMPORT Id1,Id2,Id3,...;
    or
    IMPORT Id AS Id;

    To import a module as a whole we use for example IMPORT SIO;
    We write the interface name as qualifier before an identifier
    to use it: SIO.PutText(...);
    We can also import individual names from an interface, and omit
    the qualifier:
    FROM SIO IMPORT PutText;
    PutText(...);
    The drawbacks of this method include:
    1) We can't immediately see to which interface something belongs.
    2) If two interfaces have the same identifier there could be name
    clashes.

    We can also import modules under an alias. In this method we
    import the whole interface under a different name:
    IMPORT SIO AS Out;
    Out.PutText(...);
    With this method we can shorten long interface names, and also
    use it for fast swapping names during testing.

    The diffrent methods of IMPORT can also be mixed.
    We can for example import the whole interface, and also
    import some parts of it explicitly.

    The main type of a module is conventionally named T.
    This way we can use the type as Module.T and use
    the procedures as for example Rational.Plus() for clarity.

    How to design better modules:
    1) Keep the interface small:
    Smaller units gives us flexibility.
    2) Separate functionality:
    A module should solve only one subproblem.
    For example formatting and printing or error handling
    procedures of a type should be in their own separate module.
  *)
  Fraction.Init(a,3,4);
  Fraction.Init(b,1,4);
  Fraction.Init(c,1);
  d := Fraction.Plus(a,b);
  PutInt(Fraction.Numerator(d)); PutChar('/');
  PutInt(Fraction.Denominator(d)); Nl();
  d := Fraction.Plus(b,c);
  PutInt(Fraction.Numerator(d)); PutChar('/');
  PutInt(Fraction.Denominator(d)); Nl();
END Main.

