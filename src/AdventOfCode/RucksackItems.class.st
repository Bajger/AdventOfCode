"
AoC 2022 - Day 3 part 1
"
Class {
	#name : 'RucksackItems',
	#superclass : 'AoC2022',
	#instVars : [
		'itemsBag'
	],
	#category : 'AdventOfCode-AoC2022',
	#package : 'AdventOfCode',
	#tag : 'AoC2022'
}

{ #category : 'api actions' }
RucksackItems >> compute [
	|priorities|
	priorities := self input substrings collect: [: rucksackItems|
		|compartments|
		compartments := self getCompartmentsFrom: rucksackItems. 
		self priorityOf: (self findSharedItemIn: compartments)  
	].
	^ priorities sum
]

{ #category : 'private' }
RucksackItems >> findSharedItemIn: itemArrays [ 
	
	|sets sharedItems|
	sets := itemArrays collect: #asSet.
	sharedItems := sets first.
	sets from: 2 to: sets size do: [:aSet | sharedItems := sharedItems intersection:  aSet].
	sharedItems isEmpty ifTrue: [Error signal: 'Shared item not found.'].
	^ sharedItems anyOne 
]

{ #category : 'private' }
RucksackItems >> getCompartmentsFrom: ruckSack [ 
	
	|fstCompartment sndCompartment halfIndex|
	halfIndex := ruckSack size / 2. 
	fstCompartment := ruckSack copyFrom: 1 to: halfIndex .
	sndCompartment := ruckSack copyFrom: halfIndex + 1 to: ruckSack size.
	^ { fstCompartment. sndCompartment. }
]

{ #category : 'initialization' }
RucksackItems >> initialize [ 

	super initialize.
	itemsBag := Character alphabet, (Character alphabet asUppercase).
]

{ #category : 'private' }
RucksackItems >> priorityOf: anItem [

	^ itemsBag indexOf: anItem 
]
