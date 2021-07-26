package Redis.util.jedis;

import java.util.List;

import redis.clients.jedis.Jedis;
import redis.clients.jedis.JedisPool;

public class JedisHandleShoppingCart {
	private static JedisPool pool = JedisPoolUtil.getJedisPool();
	
	public static List<String> getCart(String sessionId){
		Jedis jedis = null;
		jedis = pool.getResource();
		List<String> cart = jedis.lrange(sessionId, 0, -1);
		jedis.close();
		return cart;
	}
	
	public static void addCart(String sessionId, String shoppingCartItemVO) {
		Jedis jedis = null;
		jedis = pool.getResource();
		jedis.rpush(sessionId, shoppingCartItemVO);
	}
}
