Class {
	#name : #MyTestCase,
	#superclass : #TestCase,
	#category : #'MySet-Tests'
}

{ #category : #'as yet unclassified' }
MyTestCase class >> resources [
	"Associate the resource with this class of test cases"

	^ {MyTestResource}
]

{ #category : #running }
MyTestCase >> setUp [
	Transcript
		show: 'MyTestCase >> setUp has run.';
		cr
]
