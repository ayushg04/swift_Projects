import UIKit
import Foundation
let n=13
for i in 4...n{
    var flag: Bool=false
    for j in 2...i/2{
        if i%j==0{
            flag=true
        }
    }
    if flag==false{
        print(i)
    }
}

