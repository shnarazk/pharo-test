Class {
	#name : #MyExampleSetTest,
	#superclass : #TestCase,
	#instVars : [
		'full',
		'empty'
	],
	#category : #'MySet-Tests'
}

{ #category : #running }
MyExampleSetTest >> setUp [ 
	empty := Set new.
	full := Set with: 5 with: 6
]

{ #category : #tests }
MyExampleSetTest >> testIllegal [ 
	self should: [ empty at: 5 ] raise: Error.
	self should: [ empty at: 5 put: #zork ] raise: Error
]

{ #category : #tests }
MyExampleSetTest >> testIncludes [
	"Testing set membership"

	self assert: (full includes: 5).
	self assert: (full includes: 6)
]

{ #category : #tests }
MyExampleSetTest >> testOccurrences [
	"Testing occurrences"

	self assert: (empty occurrencesOf: 0) equals: 0.
	self assert: (full occurrencesOf: 5) equals: 1.
	full add: 5.
	self assert: (full occurrencesOf: 5) equals: 1
]

{ #category : #tests }
MyExampleSetTest >> testRemove [
	"Testing removal"
	"self run: #testRemove"

	full remove: 5.
	self assert: (full includes: 6).
	self deny: (full includes: 5)
]
