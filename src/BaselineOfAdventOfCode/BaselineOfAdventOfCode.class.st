Class {
	#name : #BaselineOfAdventOfCode,
	#superclass : #BaselineOf,
	#category : #BaselineOfAdventOfCode
}

{ #category : #baseline }
BaselineOfAdventOfCode >> baseline: spec [
	<baseline>
	spec
		for: #common
		do: [spec package: 'AdventOfCode'] 
]
