[].each do |(x)|

end
__END__
def foo(a, (b, *c, d), e = 1, *f, g, (h, *i, j),  k:, l: 1, **m, &n)
end

__END__
=begin
   [?, c, a, b]

   parameters.requireds.each do |req|
     if req is multi?
       local_table << anon
     else
       local_table << req.name
     end
   end

   parameters.requireds.each do |req|
     local_table << req.name
   end
   local_index = 0
   multis = []

   params.each do |param|
     local_index += 1
     index_in_existing_locals += param.length (if multi)
     put in ? for multi, thing else
     also if multi, add to MULTIs
     end

   tbl: [a, ?, c, ?, x]
   multis: [b, e, f, d]

   for multi in multis
     append to table
   end

   local_index = 4
   index_in_existing = 6

   for (i = local_index; i < local_table; i++)
     table[i] = locals[local_index + i]
   end

   locals: [a, ?, c, ?, g, b, e, f, d]

   Go through the parameters->requireds manually, while doing so, we:
       - Incrememt local_index which sets us up to do the rest
     - Add to the actual local table where appropriate


=end

    [a,


     ## Stack
     # 1
     # [2]
     # 3
     # [4] <-
     # call :a
     #
     ## wanted stack
     # 1
     # [2]
     # 3
     # [4] <-
     # b -> qnil
     # d -> qnil
     # EP
     # EP
     # EP
     __END__
    a { |(b), (c)| }
