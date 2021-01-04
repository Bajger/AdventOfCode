Class {
	#name : #FindNounAndVerb,
	#superclass : #RestoreIntcodeProgram,
	#instVars : [
		'noun',
		'verb'
	],
	#category : #'AdventOfCode-day2'
}

{ #category : #accessing }
FindNounAndVerb >> answer [
	^ 100 * self noun + self verb
]

{ #category : #'private ' }
FindNounAndVerb >> compute [
	0 to: 99 do: [ :aNoun | 
		0 to: 99 do: [ :aVerb | 
			self resetComputerMemory.
			self noun: aNoun.
			self verb: aVerb.
			self isOutput19690720
				ifTrue: [ ^ self answer ] ] ].
	^ nil
]

{ #category : #'private ' }
FindNounAndVerb >> isOutput19690720 [
	
	^ super compute = 19690720
	
]

{ #category : #accessing }
FindNounAndVerb >> noun [
	^ noun
]

{ #category : #accessing }
FindNounAndVerb >> noun: anObject [
	noun := anObject
]

{ #category : #'private ' }
FindNounAndVerb >> resetComputerMemory [
	
	self intcodeProgram: nil
	
]

{ #category : #'private ' }
FindNounAndVerb >> restoreGravityAssistProgram [
	
	self intcodeProgram at: 2 put: self noun.
	self intcodeProgram at: 3 put: self verb.
]

{ #category : #accessing }
FindNounAndVerb >> verb [
	^ verb
]

{ #category : #accessing }
FindNounAndVerb >> verb: anObject [
	verb := anObject
]
