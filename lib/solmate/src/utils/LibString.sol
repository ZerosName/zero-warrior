// SPDX-License-Identifier: MIT
pragma solidity >=0.8.0;

library LibString {
    function toString(uint256 value) internal pure returns (string memory str) {
        assembly {
            let newFreeMemoryPointer := add(mload(0x40), 160)

            mstore(0x40, newFreeMemoryPointer)

            str := sub(newFreeMemoryPointer, 32)

            mstore(str, 0)

            let end := str

           for { let temp := value } 1 {} {
                str := sub(str, 1)

                mstore8(str, add(48, mod(temp, 10)))

                temp := div(temp, 10)

                if iszero(temp) { break }
            }

            let length := sub(end, str)

            str := sub(str, 32)

            mstore(str, length)
        }
    }
}
