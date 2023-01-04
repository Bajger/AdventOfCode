"
AoC 2021 - day 2 part 1
"
Class {
	#name : #Dive,
	#superclass : #AoC2021,
	#instVars : [
		'depth',
		'position'
	],
	#category : #'AdventOfCode-AoC2021'
}

{ #category : #'api actions' }
Dive >> compute [ 
	self getSubmarineCommands do: [:cmdAssoc |
		self executeCommand: cmdAssoc key with: cmdAssoc value
	].
	^ self position * self depth
]

{ #category : #accessing }
Dive >> depth [

	^ depth
]

{ #category : #accessing }
Dive >> depth: anObject [

	depth := anObject
]

{ #category : #'api actions' }
Dive >> executeCommand: cmdString with: unitValue [

	cmdString = 'up' ifTrue: [self goUp: unitValue].
	cmdString = 'down' ifTrue: [self goDown: unitValue].
	cmdString = 'forward' ifTrue: [self goForward: unitValue].
]

{ #category : #'api actions' }
Dive >> getSubmarineCommands [ 
	^ self input substrings pairsCollect: [:cmd :unit | 
		cmd -> unit asNumber  ]
]

{ #category : #'private ' }
Dive >> goDown: unitValue [

	self depth: self depth + unitValue
]

{ #category : #'private ' }
Dive >> goForward: unitValue [

	self position: self position + unitValue
]

{ #category : #'private ' }
Dive >> goUp: unitValue [

	self depth: self depth - unitValue
]

{ #category : #initialization }
Dive >> initialize [ 
	super initialize.
	self depth: 0.
	self position: 0.
	
]

{ #category : #accessing }
Dive >> position [

	^ position
]

{ #category : #accessing }
Dive >> position: anObject [

	position := anObject
]
