------------------------------------------------------------------------------
-- rsa_key.lua
-- key generaration for RSA encryption
------------------------------------------------------------------------------

local rsa_key = {}

-- rsa_key.generate(size)
-- Generate a pair of RSA keys
--
-- Returns in order the modulus, the key size, the public key and the private
-- key, all as bigints

function rsa_key.generate(size)
    local p, q, n, m, e, d
    p = bigint_prime.generate_prime(size / 2)
    q = bigint_prime.generate_prime(size / 2)
    while q == p do
        q = bigint_prime.generate_prime(size / 2)
    end
    n = p * q
    m = (p - bigint.new(1)) * (q - bigint.new(1))
    e = bigint_prime.get_coprime(m)
    d = bigint_prime.mod_inverse(e, m)
    return p, q, m, bitlength(n), e, d
end

return rsa_key

