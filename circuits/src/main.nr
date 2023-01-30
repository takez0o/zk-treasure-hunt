use dep::std;

global H1: Field = 0x2760476dd10a68ec42f8ea558e12a64df906a2a7ca7ffa2d5d9960906e3b1e47; // precalculated answer hashes
global H2: Field = 0x2760476dd10a68ec42f8ea558e12a64df906a2a7ca7ffa2d5d9960906e3b1e45; // precalculated answer hashes

fn main(q: pub Field, a: Field) {
    constrain q as u8 < 12;
    constrain q as u8 > 0;

    let h = std::hash::pedersen([a])[0];

    if q == 1 {
        constrain h == H1;
    } else if q == 2 {
        constrain h == H2;
    };
}