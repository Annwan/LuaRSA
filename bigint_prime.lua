local prime = {}

prime.generate = function (length)
    
end

prime.is_primal = function (prime)
    local approx = bigint.new(5000)
    local b = 0
    for i = 1,100 do
        b = prime / approx
        approx = (b + approx) / 2
    end
    return approx
end


return prime