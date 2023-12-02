import Foundation

func generateId() -> Int64 {
	let randomUInt32 = arc4random_uniform(UInt32.max)
	
	var randomInt64 = Int64(randomUInt32)
	
	if randomInt64 < 0 {
		randomInt64 = randomInt64 &>> 1
	}
	
	return randomInt64
}
