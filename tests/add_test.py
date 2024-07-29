import torch
import sys
import bin.micro_kernel as m

t1 = torch.ones (5, dtype=torch.int32).cpu ()
t2 = torch.ones (5, dtype=torch.int32).cpu ()
t3 = torch.zeros (5, dtype=torch.int32).cpu ()

ptr1 = t1.data_ptr ()
ptr2 = t2.data_ptr ()
ptr3 = t3.data_ptr ()

print("sizeof(ptr1): {}".format(sys.getsizeof(ptr1)))

print (t1)
print ("ptr1:{}, ptr2:{}, ptr3:{} ".format (ptr1, ptr2, ptr3))
m.add(ptr1, ptr2, ptr3, t1.numel ())
print ("Completed: {}".format (t3))
