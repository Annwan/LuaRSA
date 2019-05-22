------------------------------------------------------------------------------
-- rsa_key.lua
-- key generaration for RSA encryption
------------------------------------------------------------------------------

function rsa_key.generate(size)
    local p = bigint_prime.generate_prime()
    local q = bigint_prime.generate_prime()
    while q == p do
        q = bigint_prime.generate_prime()
    end
    local n = p*q

