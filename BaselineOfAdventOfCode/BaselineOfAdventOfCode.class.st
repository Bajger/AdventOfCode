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
		do: [
			spec 
				package: 'AdventOfCode';
				package: 'AdventOfCode-AoC2019' with: [spec requires: #('AdventOfCode') ];
				package: 'AdventOfCode-Tests' with: [spec requires: #('AdventOfCode' 'AdventOfCode-AoC2019') ].
		]
]
