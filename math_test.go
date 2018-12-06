package main

import "testing"

type testPair struct {
	input  []int
	output int
}

var tests = []testPair{
	{[]int{1, 2, 3}, 6}, // pass
	{[]int{1, 2, 3}, 5}, // fail
}

func TestSum(t *testing.T) {
	for _, item := range tests {
		ret := Sum(item.input)
		if ret != item.output {
			t.Errorf("Expected %v, got %v", item.output, ret)
		}
	}
}
