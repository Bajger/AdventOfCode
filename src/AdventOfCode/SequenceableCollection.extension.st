Extension { #name : 'SequenceableCollection' }

{ #category : '*AdventOfCode' }
SequenceableCollection >> isAllIncreasingByStep: rangeOfSteps [

	self overlappingPairsDo: [:first :second  | 
		(first < second and: [rangeOfSteps includes: second - first]) ifFalse: [ ^ false] ].
	^ true
]
