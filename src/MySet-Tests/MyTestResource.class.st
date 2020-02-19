Class {
	#name : #MyTestResource,
	#superclass : #TestResource,
	#category : #'MySet-Tests'
}

{ #category : #running }
MyTestResource >> setUp [
	Transcript
		show: 'MyTestResource >> setUp has run';
		cr
]
