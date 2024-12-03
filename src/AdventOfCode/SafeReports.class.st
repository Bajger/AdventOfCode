"
AoC 2024 - Day 2 part 1
"
Class {
	#name : 'SafeReports',
	#superclass : 'AoC2024',
	#instVars : [
		'reports'
	],
	#category : 'AdventOfCode-AoC2024',
	#package : 'AdventOfCode',
	#tag : 'AoC2024'
}

{ #category : 'api actions' }
SafeReports >> compute [

	self setupReports.
	^ self countSafeReports
]

{ #category : 'api actions' }
SafeReports >> countSafeReports [

	^ self reports count: [:report | self isReportSafe: report  ]
]

{ #category : 'initialization' }
SafeReports >> initialize [ 

	super initialize. 
	self reports: OrderedCollection new.
]

{ #category : 'api actions' }
SafeReports >> isReportSafe: arrayOfNumbers [

	^ (arrayOfNumbers isAllIncreasingByStep: (1 to: 3)) or: [ 
		arrayOfNumbers reversed isAllIncreasingByStep: (1 to: 3) 
	]
]

{ #category : 'accessing' }
SafeReports >> reports [

	^ reports
]

{ #category : 'accessing' }
SafeReports >> reports: anObject [

	reports := anObject
]

{ #category : 'initialization' }
SafeReports >> setupReports [

	self input linesDo: [:line | 
		self reports add: (line substrings collect: #asNumber)
	].

]
