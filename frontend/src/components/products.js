import React from 'react';
import { useQuery } from '@apollo/client';
import { GET_PRODUCTS } from '../queries/product';
import { Table } from 'react-bootstrap';

function Products() {
  const { loading, error, data } = useQuery(GET_PRODUCTS);
  console.log(data)
  if (loading) return <p>Loading...</p>;
  if (error) return <p>Error :(</p>;

  return (
    <div>
      <h1>Product List</h1>
      <Table striped bordered hover>
        <thead>
          <tr>
            <th>Name</th>
            <th>Price</th>
            <th>SKU</th>
            <th>Quantity</th>
          </tr>
        </thead>
        <tbody>

          {data.getAllProducts.product.map(product => (
            <tr key={product.id}>
              <td>{product.name}</td>
              <td>{product.price}</td>
              <th>{product.sku}</th>
              <td>{product.quantity}</td>
            </tr>
          ))}
        </tbody>
      </Table>
    </div>
  );
}

export default Products;
