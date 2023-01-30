use dep::std;

global H1: [u8,64] = ["68","65","6C","6C","6F"]
global QMAX: Field = 13;
global QMIN: Field = 0;

fn main(q : pub Field, a : Field) {
    constrain q < QMAX
    constrain q > QMIN

    let h = std::hash::pedersen(a);

    if q == 1 {
        constrain h == H1
    }
}