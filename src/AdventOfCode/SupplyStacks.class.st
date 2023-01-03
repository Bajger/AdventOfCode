"
AoC 2022 - Day 5 part 1
"
Class {
	#name : #SupplyStacks,
	#superclass : #AoC2022,
	#instVars : [
		'crateStacks',
		'instructions'
	],
	#category : #'AdventOfCode-AoC2022'
}

{ #category : #accessing }
SupplyStacks >> compute [ 
	
	self setupStacksAndInstructions.
	self instructions do: [:instruction | instruction rearrangeOn: self crateStacks ].
	^ String withAll: (self crateStacks collect: #top)
]

{ #category : #accessing }
SupplyStacks >> crateStacks [

	^ crateStacks
]

{ #category : #accessing }
SupplyStacks >> crateStacks: anObject [

	crateStacks := anObject
]

{ #category : #private }
SupplyStacks >> getInstructionFrom: aLine [ 
	
	^ CrateInstruction from: aLine
]

{ #category : #initialization }
SupplyStacks >> initialize [
	
	super initialize.
	self instructions: OrderedCollection new
]

{ #category : #accessing }
SupplyStacks >> initializeStacks: amount [

	self crateStacks: (Array new: amount).
	1 to: self crateStacks size do: [:idx | self crateStacks at: idx put: Stack new ].
]

{ #category : #accessing }
SupplyStacks >> instructions [

	^ instructions
]

{ #category : #accessing }
SupplyStacks >> instructions: anObject [

	instructions := anObject
]

{ #category : #private }
SupplyStacks >> setupInstructions: instructionsString [

	self instructions: 
	(	(instructionsString splitOn: Character cr)	
		collect: [:line |	self getInstructionFrom: line]
	)
]

{ #category : #private }
SupplyStacks >> setupStacks: stackLineString [
	
	|stackLines stackIndices|
	stackLines := stackLineString splitOn: Character cr.
	stackIndices := self stackIndicesFrom: stackLines last.
	self initializeStacks: stackIndices size.
	stackLines allButLast reverseDo: [:crateLine |
		stackIndices withIndexDo: [:crateIdx :stackIdx|
			|crateStack aLetter|
			crateStack := self crateStacks at: stackIdx.
			aLetter := crateLine at: crateIdx.
			aLetter isLetter ifTrue: [crateStack push: aLetter]. 
	 	]		
	]
]

{ #category : #private }
SupplyStacks >> setupStacksAndInstructions [

	|stacksAndInstructions|
	stacksAndInstructions := self input splitOn: (Array with: Character cr with: Character cr). 
	self setupStacks: stacksAndInstructions first.
	self setupInstructions: stacksAndInstructions second.
]

{ #category : #private }
SupplyStacks >> stackIndicesFrom: stackIndexLine [
 
^ (stackIndexLine findTokens: Character separators) collect: [:aToken | stackIndexLine indexOfSubCollection: aToken]
]
