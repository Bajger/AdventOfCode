Class {
	#name : #ExclusivePasswordCombinations,
	#superclass : #PasswordCombinations,
	#category : #AdventOfCode
}

{ #category : #private }
ExclusivePasswordCombinations >> setAdjacentAreSame [
		
	self setAdjacentAreSameExclusively

]

{ #category : #private }
ExclusivePasswordCombinations >> setAdjacentAreSameExclusively [
		
	Transcript show: self adjacentAreSame asString;
		show: '(current) xor: ';
		show: self adjacentDigitsAreSame asString;
		show: '(new)'.

	self 	adjacentAreSame: (self adjacentAreSame xor: [ self adjacentDigitsAreSame]).
 
	Transcript show: self adjacentAreSame asString;
	show: '(new value)';
	cr.
]
