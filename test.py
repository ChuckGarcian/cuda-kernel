import torch
import bin.micro_kernel as m


t1 = torch.ones (5).cpu ()

pointer = t1.data_ptr()
print ("Pointer: {}, size: {}".format(pointer, t1.numel ()))
# t2 = torch.ones (5)


# print (m.add())


print ("Hello world!")