MODULE Main;

FROM SIO IMPORT PutInt,PutText,Nl;
FROM Fraction IMPORT T,Create,Plus,Numerator,Denominator;

VAR
  a,b,c,d:T;
  
BEGIN
  (*
    Abstract and encapsulated data types:
    A data type entails:
    1) Range:
    The range determines the values contained in the type. Values can
    certainly occur in multiple types.
    2) Operations:
    These sepcify what can be done with the values. Additional operations
    are not permitted. For built-in numeric types the language provides
    assignment, arithmetic and relational operations. For our custom
    defined types, we provide the operations.

    A problem that arises is that the clients may inadvertently
    apply some operations that are not intended. Abstract data
    types(ADTs) solve this problem. They have the following features:
    1) They have a name.
    2) The operations are completely enumerated(including initialization)
    3) The semantics of the operations is also fully specified(e.g., in
    an algebraic form).
    4) Their data are accessible only through the specified operations.
    This is achieved by hiding the actual structures of the data.

    With the help of the name, individual examples(also called instances) of
    the ADT can be declared. If the specification of the semantics is missing,
    then we speak of encapsulated data types.

    Opaque data types:
    We already talked about the principle of information hiding, where a
    module hides its data from its clients.
    This allows us to prevent an erroneous client from destroying the data.
    This principle guarantees increased security through regulation of scope.
    Hidden variables are invisible to clients. 

    Now we introduce something new: instead of variables(the data itself),
    the structure of the data - wholly or in part - can be hidden.
    Clients can create any number of instances of the respective type
    in their own scopes. Access to these instances is restricted because
    the client only partially knows the structure.

    An undisciplined client could directly access num and den fields of
    Fraction.T type. This wouldn't be possible if the client knew only
    the operations and not the data fields. This would force the client
    to use only the operations declared in the interface.

    This is where the concept of opaque types comes in.
    We publish the type name (e.g., T) and declare that T is a subtype
    of another type. This additional type is either a predefined type
    (e.g., REFANY) or the public part of the type (e.g., called Public).
    The opaque part of a type must naturally be revealed somewhere.
    This revelation is best done in a scope that is closed to the client.

    Revelation:
    A revelation reveals, within a certain scope, parts of a type that were
    undefined until then. Revelations can occur only in interfaces or in the
    outer block of implementation modules.

    Syntax of revelation declaration:
    Declaration = REVEAL Id ("=" | "<:") Type

    There are two kinds of revelations: partial and complete.
    For an opaque type we can specify any number of partial and
    exactly one complete revelation.
    A complete revelation takes the form:
    REVEAL T = type expression
    T must be an opaque type. Type expression must not be a simple type
    name, but must actually define a type. The revelation states that
    type expression is the concrete type of opaque type T. If T is a
    subtype of any type S, then type expression <: S must also apply.
    This condition is checked by the language environment. Since
    revelations are defined across module boundaries, it can generally
    be checked only at link time.
    A complete revelation exposes the internal structure of T.
    It is(normally) specified in an implementation module.
    The outer type constructor of type expression must be a branded
    reference type. The specification BRANDED marks a type to distinguish
    it from all other types. This suppresses structural type equivalence.
    There can be an optional text constant after the keyword BRANDED. If
    specified, this text unambiguously identifies the type. If it's not
    specified, then the system generates an internal identification that
    is unique during a program execution.

    Explicit branding is particularly useful when storing structures to a
    file.

    The revelation of opaque types must be distinguished from all other
    types, otherwise it might happen that a client, e.g, by pure chance,
    defines a type that has exactly the same structure as the opaque type.
    Now if the client, again by chance, employs this type instead of the
    opaque type, this suddenly grants access to the fields that should be
    opaque. The branding mechanism prevents this problem because it allows
    the compiler to detect incorrect assignment in this case, and the client
    can't employ the structurally equivalent type instead of the branded
    opaque type.

    The revelation in Fraction.m3 reveals the internal structure of T, and
    it is only visible inside this implementation module; client have no
    access to the fields num and den. Because the type has a brand, it is
    not equivalent to any other type declared as
    REF RECORD num,den:INTEGER END;

    Opaque data types(except objects) can be created only where their inner
    structure is known, i.e., in the scope of the complete revelation.
    This restriction is understandable since NEW() can't simply allocate
    memory for an unknown record.

    The partial revelation expresses only that a type is a subtype of
    another type. We normally use partial revelation in interfaces.
    They can reveal a little more information about an opaque type
    without exposing its final structure.
    A partial revelation has the form:
    REVEAL T <: Type
    Type can be any type. The s of an opaque type must be linearly ordered
    via the subtype relation; i.e., the following must apply:
    REVEAL type <: type1 AND REVEAL type <: type2 =>
    type1 <: type2 OR type2 <: type1

    This additional language element provides the expressive feature to
    hide not only algorithms but also type definitions in server modules.
  *)
  a := Create(3,4);
  b := Create(1,4);
  c := Create(1);
  d := Plus(a,b);
  PutInt(Numerator(d)); PutText("/");
  PutInt(Denominator(d)); Nl();
  d := Plus(b,c);
  PutInt(Numerator(d)); PutText("/");
  PutInt(Denominator(d)); Nl();  
END Main.

