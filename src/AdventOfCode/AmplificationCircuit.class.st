Class {
	#name : #AmplificationCircuit,
	#superclass : #AoC2019,
	#instVars : [
		'amplifiers'
	],
	#category : #'AdventOfCode-day7'
}

{ #category : #accessing }
AmplificationCircuit >> amplifiers [
	^ amplifiers
]

{ #category : #accessing }
AmplificationCircuit >> amplifiers: anObject [
	amplifiers := anObject
]

{ #category : #'actions api' }
AmplificationCircuit >> compute [

	
]

{ #category : #private }
AmplificationCircuit >> generateCyclesForIndex: phaseIndex andDo: aBlock [
	
	0 to: 4 do: [:settingA |
		0 to: 4 do: [:settingB |
			0 to: 4 do: [:settingC |
				0 to: 4 do: [:settingD |
					0 to: 4 do: [:settingE |
						{settingA. settingB. settingC. settingD. settingE}
					]]]]]	
]

{ #category : #initialize }
AmplificationCircuit >> initialize [ 
	
	super initialize.
	self amplifiers: OrderedCollection new.
	
]

{ #category : #initialize }
AmplificationCircuit >> initializeAmplifiers [

	self initializeAmpsWithProgram: self input
]

{ #category : #initialize }
AmplificationCircuit >> initializeAmpsWithProgram: codeProgram [

	$A to: $E do: [:ampId |
		|amp| 
		amp := ThrustAmplifier withId: ampId.
		amp setProgram: codeProgram.
		self amplifiers add: amp
	].
	self amplifiers first setInputSignal: 0.
]

{ #category : #'actions api' }
AmplificationCircuit >> runCircuitForPhaseSettings: aSettingArray [

	aSettingArray withIndexDo: [:aSetting :idx |
		|amp|
		amp := self amplifiers at: idx.
		amp setPhaseSetting: aSetting.
		amp runAmpProgram.
		amp isLast ifFalse: [amp setInputSignalForNextAmp: (self amplifiers at: idx + 1)]
	]
	
]

{ #category : #private }
AmplificationCircuit >> variationsOf: nrOfMembers usingRange: anInterval do: aBlock [
	
	0 to: 4 do: [:settingA |
		0 to: 4 do: [:settingB |
			0 to: 4 do: [:settingC |
				0 to: 4 do: [:settingD |
					0 to: 4 do: [:settingE |
						{settingA. settingB. settingC. settingD. settingE}
					]]]]]	
]
