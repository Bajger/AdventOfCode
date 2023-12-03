"
Common class for AoC solutions providing reading input from File and accessing solution using #day:part: method. 
"
Class {
	#name : 'AoC',
	#superclass : 'Object',
	#instVars : [
		'input'
	],
	#classInstVars : [
		'announcer'
	],
	#category : 'AdventOfCode-common',
	#package : 'AdventOfCode',
	#tag : 'common'
}

{ #category : 'accessing' }
AoC class >> announcer [
  ^ announcer ifNil: [ announcer := Announcer new ]
]

{ #category : 'executing' }
AoC class >> aocSolutionClasses [

	self shouldNotImplement 
]

{ #category : 'executing' }
AoC class >> day: adventDay [
	^ Array with: (self day: adventDay part: 1)  with:  (self day: adventDay part: 2)
]

{ #category : 'executing' }
AoC class >> day: adventDay part: partNumber [
 	|aocSolutionClass| 
	aocSolutionClass := self aocSolutionClasses 
		at: adventDay - 1 * 2 + partNumber 
		ifAbsent: [ self error: (self name asString), ' - solution not found for day: ', (adventDay asString), ' part: ', (partNumber asString), '.'].

	^ aocSolutionClass new compute
]

{ #category : 'private-constants' }
AoC class >> getInputFile [

	| repository file |
	repository := IceLibgitRepository repositories
		              detect: [ :each | each name = 'AdventOfCode' ]
		              ifNone: [ self error: 'Cannot find AdventOfCode local repository.' ].
	file := repository location / 'input' / self solutionYearString / self solutionDayFileName.
	file exists ifFalse: [ 
		self error:
			('Could not find input in: {1}.' format: { file pathString }) ].
	^ file
]

{ #category : 'private-constants' }
AoC class >> getInputString [
	"subclasses are responsible for gathering input from file for solution"
	^ self getInputFile contents withInternalLineEndings
]

{ #category : 'executing' }
AoC class >> solutionDayFileName [

	|indexOfDay|
	indexOfDay := (((self aocSolutionClasses indexOf: self) / 2) ceiling).
	^ 'day-{1}.txt' format: {indexOfDay asTwoCharacterString}
]

{ #category : 'executing' }
AoC class >> solutionYearString [

	self subclassResponsibility
]

{ #category : 'initialization' }
AoC >> initialize [ 
	self input: self class getInputString 
	
]

{ #category : 'accessing' }
AoC >> input [
	^ input
]

{ #category : 'accessing' }
AoC >> input: anObject [
	input := anObject
]
