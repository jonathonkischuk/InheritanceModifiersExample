# InheritanceModifiersExample

Splits the owner requirement into a separate file that we can import.
Instead of having one contract that handles all of the functionality, we have two.
We have one (Token) that has all of the functionlity, and the other (Ownable) has the modifier requirement.
After importing the ownable file to the token file, we are able to perform the same actions as if they were all in one file.
The purpose for doing this is to make the code more readable and organized,
