"
A SupplyStacksTest is a test class for testing the behavior of SupplyStacks
"
Class {
	#name : 'SupplyStacksTest',
	#superclass : 'TestCase',
	#category : 'AdventOfCode-Tests-AoC2022',
	#package : 'AdventOfCode-Tests',
	#tag : 'AoC2022'
}

{ #category : 'tests' }
SupplyStacksTest >> testCompute [

	|stacks|
	stacks := SupplyStacks new.
	self assert: stacks compute equals: 'GRTSWNJHH'.
]

{ #category : 'tests' }
SupplyStacksTest >> testComputeSample [

	|stacks|
	stacks := SupplyStacks new.
	stacks input: '    [D]    
[N] [C]    
[Z] [M] [P]
 1   2   3 

move 1 from 2 to 1
move 3 from 1 to 3
move 2 from 2 to 1
move 1 from 1 to 2'.
	self assert: stacks compute equals: 'CMZ'.
]

{ #category : 'tests' }
SupplyStacksTest >> testInitializeStacks [

	|stacks|
	stacks := SupplyStacks new.
	stacks initializeStacks: 5.
	self assert: stacks crateStacks size equals: 5.
	self assert: (stacks crateStacks allSatisfy: #isEmpty)
	
]

{ #category : 'tests' }
SupplyStacksTest >> testSetuInstructions [

	|lines stacks|
	lines := 
'move 1 from 2 to 1
move 3 from 1 to 3
move 2 from 2 to 1
move 1 from 1 to 2'.
	stacks := SupplyStacks new.	
	stacks setupInstructions: lines.
	self assert: stacks instructions size equals: 4.
	
]

{ #category : 'tests' }
SupplyStacksTest >> testSetupStacks [
	|stackLines stacks|
	stackLines := 
'    [D]    
[N] [C]    
[Z] [M] [P]
 1   2   3 '.
	stacks := SupplyStacks new.
	stacks setupStacks: stackLines.
	
	self assert: stacks crateStacks first pop equals: $N.
	self assert: stacks crateStacks first pop equals: $Z.
	
	self assert: stacks crateStacks second pop equals: $D.
	self assert: stacks crateStacks second pop equals: $C.
	self assert: stacks crateStacks second pop equals: $M.
	
	self assert: stacks crateStacks third pop equals: $P.
]

{ #category : 'tests' }
SupplyStacksTest >> testStackIndicesFrom [

	|stacks|
	stacks := SupplyStacks new.
	self assert: (stacks stackIndicesFrom: ' 1   2   3 ') asArray equals: #(2 6 10)
]
