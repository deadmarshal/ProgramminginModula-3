MODULE Main;

IMPORT SIO;

TYPE
  IntRef = REF INTEGER;
  StudentRef = REF Student;
  Student = RECORD
    FirstName,LastName:TEXT := "";
    Age:CARDINAL := 0;
  END;
  
VAR
  I:IntRef := NIL;
  S1:StudentRef := NIL;
  
BEGIN
  (*
    References(Pointers) are variables that hold an address in memory
    instead of a value. We can create a pointer to any type by preceding
    the type with the keyword REF. The original type is called the
    referenced type.
    For example:
    TYPE
      MyRef = REF INTEGER;
    Here MyRef is a reference to the primitive type INTEGER.
    NIL can be assigned to any pointer variable, which means the
    pointer points to nowhere(no valid address).

    NOTE: If we forget to initialize a pointer its value can be undefined.
    But if a pointer is intialized to NIL its value is defined and can be
    tested. Using an uninitialized pointer can lead to undefined behavior,
    for this reason Modula-3 by default initializes all pointers to NIL.

    NOTE: A pointer that doesn't point to a valid memory location is
    called a dangling pointer.
    
    Syntax of pointer type:
    RefType = [UNTRACED] [BRAND] REF T
    Brand = BRANDED [ConstExpression]

    Data that are global to a module are created at the start of the module.
    Thus these are often called static data. Data declared locally to an
    enclosed block are created automatically on entry into the block
    and are destroyed on leaving the block. These are often called
    semidynamic(automatic) data. Data that are created(allocated) and
    then destroyed(deallocated) on demand are called dynamic data.
    Allocation in Modula-3 is done explicitly via the NEW function and
    deallocation is done implicitly(automatically) by the garbage collector.
    
    Signature of NEW:
    NEW(referenced type,...);
    The first parameter is obligatory. If the type is a reference to a
    record type, then optional initializations of record fields can follow,
    which must be specified by name and not positionally! If the referenced
    type is an open array, then the size of the open dimensions must be
    specified here.
    
    NEW has two effects:
    1) It allocates memory(from the heap) for data of the referenced type
    (creates a new data container), which is actually a side effect.
    2) It returns a pointer to the allocated memory.

    Reference assignment and relational operations:
    The value of a reference is an address, so an assignment like
    ref2 := ref1; only copies the address of ref1 to ref2, and after
    the assignment ref2 and ref1 point to the same memory location.
    If two references are equal, they point to the same memory location,
    else they don't.
    NOTE: In Modula-3 TEXT is a reference.
    
    Dereferencing:
    If r is a variable of a reference type, then r^ stands for whatever
    r references. We say "r dereferenced". If the ^ operator
    (the dereferencing operator) is followed by further selectors
    (a "[" for indexing or a "." for accessing record fields),
    then we can omit the ^ operator,thus below lines are the same:
    ref^.FirstName := "John";
    ref.FirstName := "John";

    NOTE: To emphasize the presence of a pointer, it is often useful
    to write the ^ operator.
    
    Deallocation:
    References are normally controlled by the run-time system he
    language environment; we call such pointers traced references.
    If previously referenced data become inaccessible at some point
    (because all referencing pointers are reassigned or set to NIL),
    then their allocated memory is automatically deallocated by the
    language environment and so freed for other use.
    This part of the language environment is called the garbage collector.
    Many other programming languages such as C lack a garbage collector,
    in which case the programmer must explicitly free the pointers,
    which can lead to two errors:
    1) The programmer can forget to deallocate memory, which leads to
    inflated memory consumption.
    2) The programmer can release memory that is still referenced
    by a pointer somewhere else in the program. If such a dangling
    pointer is used later, then it can reference a region of memory
    that meanwhile has been reallocated. This leads to undefined
    behavior (at best a program crash).
    Garbage collection helps avoid these and other kinds of errors.

    For pointers no controlled by the garbage collector(untraced
    references), the language provides the keyword UNTRACED.
    Untraced references are not disposed of automatically, but
    only explicitly with the predefined DISPOSE function. 
    However DISPOSE can only be used in UNSAFE modules,because
    it can cause dangling pointers.

    Operations with references summarized:
    1) Allocation with NEW.
    2) Dereferencing to access the referenced data.
    3) Testing for equality or inequality. Any other relational operation
    makes no sense in safe modules. System programs can also test controlled
    references in unsafe modules for greater than or less than.
    4. Assignment with the usual rules of assignment compatibility.
  *)
  
  I := NEW(REF INTEGER);
  (* first we dereference the pointer(address) to get to its
     memory location then we initialize that memory location to 30 *)
  I^ := 30;
  SIO.PutInt(I^); SIO.Nl();

  S1 := NEW(StudentRef,FirstName := "John",LastName := "Doe",Age := 15);
  SIO.PutText(S1.FirstName & " " & S1.LastName & " ");
  SIO.PutInt(S1.Age); SIO.Nl();
  
END Main.

